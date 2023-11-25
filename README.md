# Iris Raycasting

**Iris** is a work-in-progress utility data pack for Minecraft: Java Edition 1.20.3+ designed to determine what block or entity a player is looking at, with micrometric precision and taking into account individual block geometries.

## Building

The `gen_files.py` script in the `build` folder can be used to generate functions and block tags for block hitboxes, using block data pulled from [ArticData](https://github.com/Articdive/ArticData). Generated files are created in the `generated` folder and should be merged with the rest of the data pack.

Working versions of Iris (with everything built) will be made available in GitHub releases.

## Using Iris

/!\ Note that **Iris is currently unreleased**. Some features are not properly tested out and some features are not yet deployed. Packaging Iris in your data packs is not recommended as it may not be fully compatible with eventual releases.

Iris provides two functions for other data packs to use: `iris:get_target` and `iris_set_coordinates`.

### `iris:get_target`

Casts a ray from the current position, oriented with the current rotation, and returns coordinates of the block or entity that is found. To tell where a player is facing, anchoring to the eye position is needed:

```mcfunction
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
```

Available information about the targeted position is saved to the `iris:output` storage. Additionally, a marker with the `iris.ray` tag is summoned at the corner of the block where the ray lands until it is killed or the function is run again.

```mcfunction
# Detect when the player is looking at stone
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute at @e[type=minecraft:marker, tag=iris.ray] if block ~ ~ ~ minecraft:stone run tellraw @a "Looking at stone"
```

Furthermore, if the ray hits an entity, it will have the `iris.target` tag until the function is run again.

```mcfunction
# Give levitation to cows the player is looking at
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
effect give @e[type=minecraft:cow, tag=iris.target] minecraft:levitation 1 0
```

Settings of the function can be modified in the `iris:settings` storage:

| Tag                 | Description                                         | Default value |
|---------------------|-----------------------------------------------------|---------------|
| `MaxRecursionDepth` | How many blocks to traverse before giving up        | 16            |
| `TargetEntities`    | Whether or not to look for collisions with entities | `false`       |
| `Blacklist`         | Which blocks to ignore during block traversal       | `"#iris:air"` |

Return and success values and exact storage output of the function are further documented in the header of the function itself (`data/iris/functions/get_target.mcfunction`).

### `iris:set_coordinates`

Teleports the executing entity to a position provided by six scores on the `iris` objective: `$[x]`, `$[y]`, `$[z]` for integer coordinates, `${x}`, `${y}`, `${z}` for fractional coordinates (with a scale of 1,000,000). After running `iris:get_target`, the six scores are set to the exact position where the ray lands and so `iris:get_target` and `iris:set_coordinates` can easily be used in conjunction:

```mcfunction
# Teleport the player where they are looking
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute as <player> run function iris:set_coordinates
```


## Including Iris in your data pack

To include Iris in your own data pack:
- Copy the `iris` folder and its contents in the `data` folder of your data pack
- Make sure the `#minecraft:load` function tag includes `iris:setup/load`

If you are redistributing modified versions of Iris as a part of your own data packs, it is recommended to change the `iris` namespace to avoid conflicts with other data packs using Iris. To do so, you may simply rename the `iris` folder to e.g. `iris_mypack` and every instance of `iris` in the contents of data pack files to `iris_mypack` (including storage names, objectives, entity tags...)

## How it works

Since this will most likely be used mostly by other data pack nerds, here is a summary of how Iris operates.

### Getting the coordinates/rotation

`execute store` can be used to get an entity's position, however any scale over 70 is unusable for X and Z coordinates due to overflowing. To get the current position with enough detail, string manipulation is done with macro functions to cut and read everything past the decimal point in any position coordinate. From then on, the starting position is saved as six scores: the integer part (`$[x]`, `$[y]`, `$[z]`) and the fractional part (`${x}`, `${y}`, `${z}`).


To get the rotation, a marker is summoned 1,000,000 blocks forward starting from `0.0`, `0.0`, `0.0` using the executing rotation. The marker's position is a steering vector that can be used in later calculations.

### Raycasting

The data pack solves simple linear equations to figure out which tile it hits next (ray/plane intersections), instead of progressing by a fixed length at every iteration like most raycasting functions do. Upon hitting a block other than air (or an entity, if `TargetEntities` is true), it gets its shape as a list of axis-aligned bounding boxes (AABB) and checks which faces it hits. For every AABB, there are three surfaces to check, and the three others (back-faces) are culled.