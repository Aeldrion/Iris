# Iris Raycasting

Iris is a utility data pack for Minecraft: Java Edition 1.16+ designed to determine the block a player is facing, with micrometric precision and taking into account unusual block geometries. As of now, Iris is unfinished and will only work for the few blocks it currently supports (beds, buttons, carpets, doors, fence gates, pressure plates, sapling, slabs, stairs, standing signs and standing banners). Other blocks will be treated as 1x1x1 cubes.

---

# How to use

## Using Iris

The only function that other data packs should use is `iris:get_targeted_block`. The function will cast a ray starting at the executing position and oriented with the executing rotation and return coordinates of the block that is found. To tell which block a player is facing, anchoring to the eye position is needed:

```mcfunction
execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_targeted_block
```

## Output

Iris stores output data to command storage `iris:output`. Additionally, a marker entity with the `iris.ray` tag is placed where the ray hits.

```mcfunction
execute at @e[type=minecraft:marker, tag=iris.ray] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1
```

Below is a list of all the information that Iris will save to storage every time `iris:get_targeted_block` is executed.

#### Contact surface

`ContactSurface` is a list of six doubles between 0.0d and 1.0d. The first three numbers and the last three numbers are the coordinates of two opposite corners of the surface area the ray hits. Origin is the Wwest, North, bottom corner of the 1x1x1 tile that is hit.

#### Contact coordinates

`ContactCoordinates` is a list of three doubles between 0.0 and 1.0d, corresponding to the coordinates where the ray hits. Origin is the West, North, bottom corner of the 1x1x1 tile that is hit.

#### Targeted block

`TargetedBlock` is a list of three integers, corresponding to the world coordinates of the block that the ray hits.

#### Placed position

`PlacedPosition` is a list of three integers, corresponding to the world coordinates of the block the ray was in before entering the tile it hit. In other words, if a player were to place a block, this is the position where the block would be placed, unless the player is placing a block behind them (e.g. placing a block against a climbed ladder).

---

# Including Iris in your data pack

## How to add Iris to your own data pack

To add Iris to your data pack, copy the `iris` namespace folder to your own data pack folder. Also copy the `minecraft` namespace folder or, if your pack uses the `#minecraft:load` function tag, make sure to include `iris:setup/load`. Crediting is not required, but if you wish to credit me nonetheless, you can do so with the following notice wherever you please:

> Uses Iris by Aeldrion \
> https://github.com/Aeldrion/Iris \
> https://twitter.com/Aeldrion

## Publishing modified versions of Iris

You are free to redistribute Iris or modified versions of Iris as a part of your own data packs. The latter can be useful, for example, if you want to detect where one specific block is being placed and want to avoid running unnecessary commands when raycasting. However, since multiple data packs might be using Iris on the same world, it is recommended to distribute modified versions of Iris with a modified namespace as well (e.g. `iris_mypack`) so not to cause compatibility issues with other data packs. You can do so by replacing all occurrences of `iris:` with `iris_mypack:` in the data pack using a code editor's "Replace in folder" feature for example, then renaming the `iris` namespace folder to `iris_mypack`.

---

# How does it work?

Since this will most likely be used by other data pack nerds, here is a summary of how Iris operates.

## Getting the coordinates/rotation

`execute store` can be used to get an entity's position, however any scale over 70 is unusable for X and Z coordinates due to overflowing. To get the current position with enough detail, a marker is summoned and multiple distance checks from the edge of the current block are done using `align x` and `align z`.
To get the rotation, a marker is summoned 1,000,000 blocks forward starting from 0.0, 0.0, 0.0 using the executing rotation. The marker's position is a steering vector that can be used in later calculations.

## Raycasting

The data pack solves simple linear equations to figure out which tile it hits next (ray/surface intersection), instead of progressing by a fixed length at every iteration like most raycasting functions do. Upon hitting a block other than air, it gets a list of its collision surfaces and again checks which ones it hits. Some of these surfaces might not be candidates at all, for example if the ray is going North but the surface can only be hit from the South.
The raycasting function recursively calls itself for every new block it enters, until a surface is hit or a hardcoded limit is reached.
