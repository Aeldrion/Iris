# Iris Raycasting

**Iris** is a utility data pack for Minecraft: Java Edition 1.20.3+ designed to determine what block or entity a player is looking at, with micrometric precision and taking into account individual block geometries.

# Table of contents
- [Rationale](#rationale)
- [Documentation](#documentation)
- [Installation](#installation)
- [Building](#building)
- [Contributing](#contributing)
- [How it works](#how-it-works)

## Rationale

In Minecraft data packs, a common problem is to identify where the player is looking, for example to detect where a block has been or should be placed.
To that end, many data pack developers use a simple recursive method wherein the executing position advances along a ray with a constant step size, until a block is found or a certain recursion depth is reached:
```mcfunction
@mypack:main
scoreboard players set depth obj 0
function mypack:raycast_loop
```
```mcfunction
@mypack:raycast_loop
execute unless block ~ ~ ~ minecraft:air run return run say Found block!
scoreboard players add depth obj 1
execute if score depth obj matches ..100 positioned ^ ^ ^0.1 run function mypack:raycast_loop
```
This approach has two major problems:
- The constant step size means that the looping function might be running in the same block many times unnecessarily, or skipping through the corner of a block. Developers typically try to strike a balance between accuracy (a lower step size is less likely to skip through blocks) and performance (a higher step size will avoid repeating many iterations on the same block).
- Minecraft commands do not provide a primitive for checking whether the executing position is within a block's collision box, so we usually have to check whether the current block is something other than air. We might get false positives because many blocks can be looked _through_ without being looked _at_ (_e.g._ stairs, slabs, torches...).

Iris tackles both of these problems by computing exactly which blocks need to be traversed and by computing the collision box of every block on the ray's path.

To work out collision boxes, one would have to get the geometries of all block states in the game. Being able to automate this task is particularly important, because new Minecraft versions often come with new blocks and unique shapes. Iris can be easily updated for every new Minecraft version, making the development process more ergonomic for data pack developers.

## Documentation

Iris provides three functions for other data packs to use:
- [`iris:get_target`](#irisget_target) to find the block or entity that a player is looking at
- [`iris:is_in_block`](#irisis_in_block) to tell whether the current position is within a block's collision box
- [`iris:set_coordinates`](#irisset_coordinates) to teleport an entity to the target position

The following functions are not designed as library functions, but may be useful to other data packs:
- `iris:get_hitbox/block` saves the hitbox of the block at the current position to `iris:data shape`
- `iris:get_hitbox/entity` saves the hitbox of the executing entity within the block at the executing position to `iris:data shape`

### `iris:get_target`

Casts a ray from the current position, oriented with the current rotation, and returns data on the block or entity that is found. To tell where a player is facing, starting at the eye position is needed. Entities with the `iris.ignore` tag are ignored.

```mcfunction
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
```

#### Settings

Settings of the function can be modified in the `iris:settings` storage:

| Tag                 | Description                                              | Default value              |
|---------------------|----------------------------------------------------------|----------------------------|
| `max_distance`      | How many blocks to traverse before giving up             | `5.0`                      |
| `target_entities`   | Whether or not to look for collisions with entities      | `false`                    |
| `callback`          | A command to run where the raycast ends                  | Unset                      |
| `blacklist`         | Which blocks to ignore during block traversal            | `"#iris:shape_groups/air"` |
| `whitelist`         | The only blocks to look for during traversal             | Unset                      |

To ensure compatibility with other packs using Iris, it is recommended to make sure the `iris:settings` storage is modified before every single call to `iris:get_target`:
```mcfunction
data merge storage iris:settings {\
    max_distance: 5.0,\
    target_entities: false,\
    callback: "",\
    blacklist: "#iris:shape_groups/air",\
    whitelist: ""\
}
execute as @p at @s anchored eyes positioned ^ ^ ^ function iris:get_target
```
For simplicity of use, `callback`, `blacklist` and `whitelist` can be either unset or set to an empty string.

For performance, when using a custom blacklist, it is recommended to make sure blocks with no outline (e.g. `minecraft:air`) are included.

#### Output

The `result` of this function is the distance (in millionths of a block) before an obstacle is hit, or 0 if no block or entity is found. The `success` is 1 if a block or entity was hit, 0 otherwise.

Available information about the targeted position is saved to the `iris:output` storage at the following paths:
| Tag               | Description                            
|-------------------|------------------------------------------------
| `type`            | The target: `"block"`, `"entity"` or `"none"`.
| `distance`        | The distance from the starting position to the target, as a double; unset if type is `"none"`.
| `block`           | The world coordinates of the block that is hit by the ray, as a list of three integers; set only if `type` is `"block"`.
| `UUID`            | The UUID of the entity that is hit by the ray, as an array of four integers; set only if `type` is `"entity"`.
| `target.position` | The exact world coordinates of the ray-box intersection, as a list of three doubles; unset if `type` is `"none"`.
| `target.normal`   | The face normal of the face that is it by the ray, as a list of three integers (e.g. `[0, 1, 0]`); unset if `type` is `"none"`.
| `target.box`      | The AABB that is hit by the ray, as a compound of the form `{min: [x, y, z], max: [x, y, z]}`. Coordinates correspond to positions within the targeted block, between `0.0d` and `1.0d`. Unset if `type` is `"none"`.
| `target.face`     | The face that is hit by the ray, in the same format as `target.box`; unset if `type` is `"none"`.

#### Examples

##### Targeting entities that the player looks at

In the following example, levitation is given to cows that the player looks at.

```mcfunction
execute store result storage iris:settings max_distance float 0.000001 run attribute @s minecraft:entity_interaction_range get 1000000
data merge storage iris:settings {\
    target_entities: true,\
    callback: "",\
    blacklist: "#iris:shape_groups/air",\
    whitelist: ""\
}

execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute at <player> run effect give @e[type=minecraft:cow, tag=iris.targeted_entity, distance=..10] minecraft:levitation 1 0
```

##### Targeting hidden blocks

In the following example, a sound is played at the location of diamond ores that a player looks at, including through other blocks.

```mcfunction
data merge storage iris:settings {\
    max_distance: 10.0,\
    target_entities: false,\
    callback: "playsound minecraft:block.note_block.bell block",\
    blacklist: "",\
    whitelist: "#minecraft:diamond_ores"\
}

execute as @a at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
```

##### Predicting where a block will be placed

In the following example, we simulate the player attempting to place a block of cobblestone. We use the face normal (`target.normal` in storage `iris:output`) to see where the block should be placed relative to the targeted block.

```mcfunction
execute store result storage iris:settings max_distance float 0.000001 run attribute @s minecraft:block_interaction_range get 1000000
data merge storage iris:settings {\
    target_entities: false,\
    callback: "function mypack:place_cobblestone",\
    blacklist: "#iris:shape_groups/air",\
    whitelist: ""\
}

execute at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
```
```mcfunction
@mypack:place_cobblestone
# If the targeted block is replaceable, place cobblestone here
execute if block ~ ~ ~ #minecraft:replaceable run return run setblock ~ ~ ~ minecraft:cobblestone

# Otherwise, use face normal
data modify storage mypack:args dx set from storage iris:output target.normal[0]
data modify storage mypack:args dy set from storage iris:output target.normal[1]
data modify storage mypack:args dz set from storage iris:output target.normal[2]
function mypack:place_cobblestone_offset with storage mypack:args
```
```mcfunction
@mypack:place_cobblestone_offset
$execute store success score placed_stone obj if block ~$(dx) ~$(dy) ~$(dz) #minecraft:replaceable run setblock ~$(dx) ~$(dy) ~$(dz) minecraft:cobblestone
$execute if score placed_stone obj matches 1 run playsound minecraft:block.stone.place block @a ~$(dx) ~$(dy) ~$(dz)
```


### `iris:is_in_block`

Returns whether the current executing position is inside a block's collision box.

```mcfunction
execute if function iris:is_in_block run say 
```

#### Output

The `result` and `success` of this function are 1 if the executing position is inside a block's collision box, 0 otherwise.


### `iris:set_coordinates`

Teleports the executing entity to a position provided by six scores on the `iris` objective: `$[x]`, `$[y]`, `$[z]` for integer coordinates, `${x}`, `${y}`, `${z}` for fractional coordinates (with a scale of 1,000,000). After running `iris:get_target`, the six scores are set to the exact position where the ray lands and so `iris:get_target` and `iris:set_coordinates` can easily be used in conjunction:

```mcfunction
# Teleport the player where they are looking
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute as <player> run function iris:set_coordinates
```

Note that the exact position of the target is also available as `target.position` in storage `iris:output`.

#### Output

The `result` and `success` of this function is 1 if executed by an entity, 0 otherwise.


## Building

> [!NOTE]
> To use Iris on any supported Minecraft version, simply download Iris directly from [GitHub releases](https://github.com/Aeldrion/Iris/tags).
> This section details how you can build Iris yourself.

- Generate a report of block shapes and entity type dimensions using [IrisDataGen](https://github.com/Aeldrion/IrisDataGen), then place both files under `resources`.
- Build with [Beet](https://github.com/mcbeet/beet).

To install dependencies, we recommend [uv](https://github.com/astral-sh/uv):
```
uv sync
uv run beet
```

### Requirements

- Python 3.14
- [Beet](https://github.com/mcbeet/beet)
- [Bolt](https://github.com/mcbeet/beet/tree/main/packages/bolt)

## Installation

To include Iris in your own data pack:
- Copy the `iris` folder and its contents in the `data` folder of your data pack
- Make sure the `#minecraft:load` function tag includes `iris:setup/load`

It is recommended to change the `iris` namespace to avoid conflicts with other data packs using Iris.
Simply rename the `iris` folder to something like `iris_mypack` or `mypack.iris` and replace every instance of `iris` in the contents of data pack files with the new name (for example with VSCode Search and Replace).

## Contributing

Contributions are welcome, but it's better if we talk about it before making a pull request. Who knows, I might be working on yet another rewrite :)

This project uses uv. The code is formatted and checked with Ruff:
```sh
$ uv run ruff format
$ uv run ruff check
```

## How it works

### Getting the coordinates/rotation

`execute store` and `data get` can be used to get an entity's position as integers; however because scoreboard values are 32-bit integers and because players can have X and Z coordinates as high as 30,000,000, any scale over 70 is unusable for X and Z coordinates due to possible overflowing.

To get the current position with enough precision, we use macro functions to get the current coordinates as a string and to cut and read everything past the decimal point. The starting position is saved as six scores: the integer part (`$[x]`, `$[y]`, `$[z]`) and the fractional part (`${x}`, `${y}`, `${z}`).

To get the rotation, a marker is summoned 1,000,000 blocks forward starting from world origin (`0.0`, `0.0`, `0.0`) using the executing rotation. The marker's position describes the rotation as a steering vector that can be used in later calculations.

### Raycasting

We solve simple linear equations to figure out which tile the ray traverses next (ray/plane intersections). Upon hitting a block outside the blacklist or within the whitelist, we get its shape as a list of axis-aligned bounding boxes (AABB) and check which faces the ray hits. For every AABB, there are six candidates; back-face culling narrows it down to three.

### Getting the hitbox of a block

Block hitbox information is pulled from [IrisDataGen](https://github.com/Aeldrion/IrisDataGen). Blocks with the same set of block state properties and corresponding hitboxes are grouped together in block tags. Iris also accounts for the random horizontal offset on the hitbox of a few blocks, namely flowers, bamboo, pointed dripstone, and mangrove propagules. Minecraft computes this offset with a seeded RNG using the tile's X and Z coordinates; this offset can be computed identically on the scoreboard.

### Getting the hitbox of an entity

Likewise, entity hitbox information is pulled from IrisDataGen and entities of similar sizes are grouped together in entity type tags. There are special cases to take into account: players sneaking or swimming, slimes of different sizes, baby mobs, entities with a non-default `scale` attribute...
