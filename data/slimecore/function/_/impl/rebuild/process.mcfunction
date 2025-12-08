# IMPL > slimecore:rebuild
# process
#--------------------
# ./main
#--------------------

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
# DEBUG
function slimecore:_/test_manifests

scoreboard players set *manifest_time _slimecore 0

# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ data.packs
execute store result score *x _slimecore run function slimecore:eval/build

# DEBUG / HOOK
execute if score *x _slimecore matches 0 run tellraw @a {text:"[ BUILD ERROR ]", color: dark_red}
execute if score *x _slimecore matches 0 run tellraw @a {storage:"slimecore:out", nbt:"build.result.error", color: red}
execute if score *x _slimecore matches 0 run return 0

# DEBUG / HOOK
tellraw @a {text:"[ BUILD SUCCESS ]", color: green}
tellraw @a {storage:"slimecore:out", nbt:"build.result.success.order", color: green}

data modify storage slimecore:_ v.rebuild.build set from storage slimecore:out build.result.success

# unload old build datapacks:
data modify storage slimecore:_ v.rebuild.old_links set from storage slimecore:data world.datapack_links