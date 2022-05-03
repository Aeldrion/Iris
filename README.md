# Retina Raycasting

**Retina** is a fork of Aeldrion's original [Iris](https://github.com/Aeldrion/Iris) raycasting data pack for Minecraft: Java Edition 1.18+ with additional front-end (ironic because in an eye, the iris is in front of the retina) features for other datapacks to use, including raycasts with particle lines, randomly offset raycasts, and multi-raycasting. 

Retina's features are mostly [bodges](https://en.wiktionary.org/wiki/bodge#Verb), so don't expect great functionality.
Also, keep in mind that the original Iris datapack is still in development and does not yet support all blocks and entities.

---

# How to use

## Using Retina

Retina provides four functions for other datapacks to make use of. Two of them, `retina:get_target` and `retina:set_coordinates`, are the same as in the original Iris ([see here](https://github.com/Aeldrion/Iris#using-iris)), so I will exclude them for simplicity. The other two, `retina:run_raycast`, and `retina:display_particle` are new.

### Run racyast

The `retina:run_raycast` function does all the steps of a raycast in a self-contained package. There is no need to specify anything in your command other than the executing entity, as the rest is taken care of.

```mcfunction
# Run a raycast whenever a player is holding a bow
execute as @a[nbt={SelectedItem:{id:"minecraft:bow"}}] run function retina:run_raycast
```

This function is also highly versatile, using scoreboard information to determine the parameters of the raycast:

Basic parameters: \
`$vertical_count retina`: # of raycasts to run with vertical offset. Defaults to 1. \
`$horizontal_count retina`: # of raycasts to run with horizontal offset. Defaults to 1. \
     (ex: setting `$vertical_count` to 2 and `$horizontal_count` to 3 would create a 2x3 grid of raycasts). \
`$center_count retina`: # of extra raycasts to run exactly aligned to the crosshair. Defaults to 0. \
`$offset retina`: Angle of spacing (in degrees) between each raycast in a multi-raycast. Defaults to 5. \

Randomization: \
`$spread_enabled_global retina`: Enables/disables random spread on ALL multi-raycasts. No effect on single raycasts. Defaults to 1. \
`$spread_enabled_local retina`: Enables/disables random spread on THIS raycast (single or multi!). Defaults to 0. \
`$spread_min retina` & `$spread_max retina`: Defaults to 10. \
     Single raycasts -> Min/max number of *degrees* to randomly offset this raycast. \
     Multi raycasts -> Min/max *multiplier* of `$offset retina`. 10–1 scale. (ie: 20 would mean a x2 multiplier) \

Visuals: (applies to all raycasts done by the *entity*) \
`<executing entity> retina.show_particle`: Enables/disables showing a particle at the *endpoint* of the raycast. \
`<executing entity> retina.show_particle`: Enables/disables showing a line of particles along the *path* of the raycast. \

### Display particle

By default the `retina:display_particle` function does absolutely nothing other than run `particle crit`. This isn't exactly the most modular, so you'll have to edit it directly if you want your datapack to include custom particle effects. For example:
```mcfunction
execute if score @s <objective> matches 3 run particle minecraft:soul_fire_flame ^ ^ ^ 0 0 0 0.5 20 force @a[team=RED]
```
I could have maybe made this a little more modular by summoning markers that get tagged by this function, but that is laggy, and also Occam's Razor says that "entities should not be multiplied beyond necessity".

## Settings

### Target entities

By default, the ray will ignore entities and will only attempt to find blocks. If you want to account for entities the player might be looking at, set `TargetEntities` to `true` (`1b`):

```mcfunction
data modify storage retina:input TargetEntities set value true
```

If `TargetEntities` is true, the ray will stop if it hits an entity. Entities through which a block can be placed are ignored. For example, mobs, minecarts or falling blocks may be detected, but items and arrows are ignored. The executing entity itself is ignored as well.

### Maximum recursion depth

By default, the ray will traverse up to 25 blocks and give up if no block or entity is found. This limit can be modified by changing the value of `MaxRecursionDepth`:

```mcfunction
data modify storage retina:input MaxRecursionDepth set value 50
```

Values under 10 may fail to detect blocks that are within arm reach of the player.

## Output

Below is a list of all the information that Retina will save to storage every time `retina:get_target` is executed.

### Target

`Target` is a string that indicates what the ray hits. Set to `"BLOCK"` if a block is found, `"ENTITY"` if an entity is found, `"NONE"` if the maximum recursion depth is reached without finding a block or an entity.

### Distance

`Distance` is a double corresponding to the distance the ray needs to travel before hitting a solid surface. Distance is also stored to the `$total_distance retina` score with a scale of 1,000,000.
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

# Including Retina in your data pack

## How to

To add Retina to your data pack, copy the `retina` namespace folder to your own data pack folder. Also copy the `minecraft` namespace folder or, if your pack uses the `#minecraft:load` function tag, make sure to include `retina:setup/load`.

## Crediting

Crediting is not required, but if you wish to credit me and Aeldrion nonetheless, you can do so with the following notice wherever you please:

> Uses Retina by Nicoder (based off Iris and Random by Aeldrion) \
> https://github.com/Nico314159/Retina \
> https://github.com/Aeldrion/Iris \
> https://twitter.com/Aeldrion

## Publishing modified versions of Retina

You are free to redistribute Retina or modified versions of Retina as a part of your own data packs. The latter can be useful, for example, if you want to detect where one specific block is being placed and want to avoid running unnecessary commands when raycasting. However, since multiple data packs might be using Iris and/or Retina on the same world, it is recommended to distribute modified versions of either pack with a modified namespace as well (e.g. `retina_mypack`) to avoid conflicts with other data packs. You can do so by replacing all occurrences of `retina:` with `retina_mypack:` in the data pack using a code editor's "Replace in folder" feature for example, then renaming the `retina` namespace folder to `retina_mypack`.

As an example of this, see [Banners on beds](https://www.planetminecraft.com/data-pack/banners-on-beds/), which made use of a modified version of the original Iris. Some functions were modified to remove unnecessary checks, and the `iris` namespace was replaced with `iris_bob`.

---

# How does it work?

Since this will most likely be used mostly by other data pack nerds, [here](https://github.com/Aeldrion/Iris#how-does-it-work) is a summary of how the original Iris operates.
Explaining how Retina's new functions operate is left as an exercise to the reader.
