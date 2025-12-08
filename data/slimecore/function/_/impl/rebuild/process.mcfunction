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

data modify storage slimecore:_ v.rebuild.packs set from storage slimecore:_ data.packs

# add previously disabled:
data modify storage slimecore:_ v.rebuild.disables set from storage slimecore:data world.disabled_packs

# enables:
data modify storage slimecore:_ v.rebuild.enables set from storage slimecore:in rebuild.enables
execute if data storage slimecore:_ v.rebuild.enables[0] run function slimecore:_/impl/rebuild/enables/each

# add new disables/uninstalls to {..disables}:
data modify storage slimecore:_ v.rebuild.disables append from storage slimecore:in rebuild.disable[]
data modify storage slimecore:_ v.rebuild.disables append from storage slimecore:in rebuild.uninstall[]

# remove disabled manifests:
execute if data storage slimecore:_ v.rebuild.disables[0] run function slimecore:_/impl/rebuild/disables/each

# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ data.packs
execute store result score *x _slimecore run function slimecore:eval/build

# DEBUG
execute if score *x _slimecore matches 0 run tellraw @a {text:"[ BUILD ERROR ]", color: dark_red}
execute if score *x _slimecore matches 0 run tellraw @a {storage:"slimecore:out", nbt:"build.result.error", color: red}

execute if score *x _slimecore matches 0 run data modify storage slimecore:out rebuild.result.error.build_error set from storage slimecore:out build.result.error
execute if score *x _slimecore matches 0 run return 0

# DEBUG
tellraw @a {text:"[ BUILD SUCCESS ]", color: green}
tellraw @a {storage:"slimecore:out", nbt:"build.result.success.order", color: green}

data modify storage slimecore:_ v.rebuild.build set from storage slimecore:out build.result.success

# unload old build datapacks:
data modify storage slimecore:_ v.rebuild.old_links set from storage slimecore:data world.datapack_links