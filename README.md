# Iris Raycasting

**Iris** is a utility data pack for Minecraft: Java Edition 1.17+ designed to determine what block or entity the player is looking at, with micrometric precision and taking into account unusual block geometries.

Iris is still in development and does not yet support all blocks and entities.

---

# How to use

## Using Iris

Iris provides two functions for other data packs to use: `iris:get_target` and `iris:set_coordinates`.

### Get target

The `iris:get_target` function casts a ray from the current position, oriented with the current rotation, and returns coordinates of the block or entity that is found. To tell where a player is facing, anchoring to the eye position is needed:

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

### Set coordinates

The `iris:set_coordinates` function teleports the executing entity to the exact position where the ray lands after running `iris:get_target`.

```mcfunction
# Play a particle effect where the player is looking
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute as @e[type=minecraft:marker, tag=iris.ray] run function iris:set_coordinates
execute at @e[type=minecraft:marker, tag=iris.ray] run particle minecraft:flame
```

## Settings

### Target entities

By default, the ray will ignore entities and will only attempt to find blocks. If you want to account for entities the player might be looking at, set `TargetEntities` to `true` (`1b`):

```mcfunction
data modify storage iris:input TargetEntities set value true
```

If `TargetEntities` is true, the ray will stop if it hits an entity. Entities through which a block can be placed are ignored. For example, mobs, minecarts or falling blocks may be detected, but items and arrows are ignored. The executing entity itself is ignored as well.

### Maximum recursion depth

By default, the ray will traverse up to 16 blocks and give up if no block or entity is found. This limit can be modified by changing the value of `MaxRecursionDepth`:

```mcfunction
data modify storage iris:input MaxRecursionDepth set value 40
```

Values under 10 may fail to detect blocks that are within arm reach of the player.

## Output

Below is a list of all the information that Iris will save to storage every time `iris:get_target` is executed.

### Target

`Target` is a string that indicates what the ray hits. Set to `"BLOCK"` if a block is found, `"ENTITY"` if an entity is found, `"NONE"` if the maximum recursion depth is reached without finding a block or an entity.

### Distance

`Distance` is a double corresponding to the distance the ray needs to travel before hitting a solid surface. Distance is also stored to the `$total_distance iris` score with a scale of 1,000,000.
Only exists if `Target` is `"BLOCK"` or `"ENTITY"`.

### Targeted block

`TargetedBlock` is a list of three integers, corresponding to the world coordinates of the block that the ray hits.
Only exists if `Target` is `"BLOCK"`.

### Targeted entity

`TargetedEntity` is an array of four integers, corresponding to the UUID of the entity that the ray hits.
Only exists if `Target` is `"ENTITY"`.

### Placed position

`PlacedPosition` is a list of three integers, corresponding to the world coordinates of the block the ray was in before entering the tile it hit. In other words, if a player were to place a block, this is the position where the block would be placed, unless the player is placing a block behind them (e.g. placing a block against a climbed ladder).
Only exists if `Target` is `"BLOCK"`.

### Contact coordinates

`ContactCoordinates` is a list of three doubles between 0.0 and 1.0d, corresponding to the coordinates where the ray hits. Origin is the West, North, bottom corner of the 1x1x1 tile that is hit.
Only exists if `Target` is `"BLOCK"` or `"ENTITY"`.

### Contact surface

`ContactSurface` is a list of six doubles between 0.0d and 1.0d. The first three numbers and the last three numbers are the coordinates of two opposite corners of the surface area the ray hits. Origin is the West, North, bottom corner of the 1x1x1 tile that is hit.
Only exists if `Target` is `"BLOCK"` or `"ENTITY"`.

---

# Including Iris in your data pack

## How to

To add Iris to your data pack, copy the `iris` namespace folder to your own data pack folder. Also copy the `minecraft` namespace folder or, if your pack uses the `#minecraft:load` function tag, make sure to include `iris:setup/load`.

## Publishing modified versions of Iris

You are free to redistribute Iris or modified versions of Iris as a part of your own data packs. The latter can be useful, for example, if you want to detect where one specific block is being placed and want to avoid running unnecessary commands when raycasting. However, since multiple data packs might be using Iris on the same world, it is recommended to distribute modified versions of Iris with a modified namespace as well (e.g. `iris_mypack`) to avoid conflicts with other data packs. You can do so by replacing all occurrences of `iris:` with `iris_mypack:` in the data pack using a code editor's "Replace in folder" feature for example, then renaming the `iris` namespace folder to `iris_mypack`.

As an example of how to make a data pack with a modified version of Iris, see [Banners on beds](https://www.planetminecraft.com/data-pack/banners-on-beds/). Some functions were modified to remove unnecessary checks, and the `iris` namespace was replaced with `iris_bob`.

---

# How does it work?

Since this will most likely be used mostly by other data pack nerds, here is a summary of how Iris operates.

## Getting the coordinates/rotation

`execute store` can be used to get an entity's position, however any scale over 70 is unusable for X and Z coordinates due to overflowing. To get the current position with enough detail, a marker is summoned and multiple distance checks from the edge of the current block are done using `align x` and `align z`.
To get the rotation, a marker is summoned 1,000,000 blocks forward starting from `0.0`, `0.0`, `0.0` using the executing rotation. The marker's position is a steering vector that can be used in later calculations.

## Raycasting

The data pack solves simple linear equations to figure out which tile it hits next (ray/surface intersection), instead of progressing by a fixed length at every iteration like most raycasting functions do. Upon hitting a block other than air (or an entity, if `TargetEntities` is true), it gets a list of its collision surfaces and again checks which ones it hits. Some of these surfaces might not be candidates at all, for example if the ray is going North but the surface can only be hit from the South.
The raycasting function recursively calls itself for every new block it enters, until a surface is hit or until the maximum depth is reached.
