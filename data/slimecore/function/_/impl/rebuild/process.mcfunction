# IMPL > slimecore:rebuild
# process
#--------------------
# ./main
#--------------------

# out init:
data modify storage slimecore:out rebuild.result set value {error:{}, success:{uninstalled:[]}}
scoreboard players set *rebuild.error _slimecore 0

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
# DEBUG
function slimecore:_/test_manifests

scoreboard players set *manifest_time _slimecore 0

data modify storage slimecore:_ v.rebuild.packs set from storage slimecore:_ data.packs
data modify storage slimecore:_ v.rebuild.old_data set from storage slimecore:data

# add previously disabled to {..disables}:
data modify storage slimecore:_ v.rebuild.disables set from storage slimecore:_ v.rebuild.old_data.world.disabled_packs

# remove enables from {..disables}
data modify storage slimecore:_ v.rebuild.enables set from storage slimecore:in rebuild.enables
execute if data storage slimecore:_ v.rebuild.enables[0] run function slimecore:_/impl/rebuild/enables/each

data modify storage slimecore:_ v.rebuild.stored_disables set from storage slimecore:_ v.rebuild.disables

# add new disables/uninstalls to {..disables}:
data modify storage slimecore:_ v.rebuild.disables append from storage slimecore:in rebuild.disable[]
data modify storage slimecore:_ v.rebuild.disables append from storage slimecore:in rebuild.uninstall[]

#- remove {..disables} from {..packs}
#- add to {..stored_disables} where present in old build and not uninstalling
execute if data storage slimecore:_ v.rebuild.disables[0] run function slimecore:_/impl/rebuild/disables/each

# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ data.packs
execute store result score *x _slimecore run function slimecore:eval/build
execute unless score *x _slimecore matches 1 run scoreboard players set *rebuild.error _slimecore 1

# DEBUG
execute if score *rebuild.error _slimecore matches 0 run tellraw @a {text:"[ BUILD ERROR ]", color: dark_red}
execute if score *rebuild.error _slimecore matches 0 run tellraw @a {storage:"slimecore:out", nbt:"build.result.error", color: red}

execute if score *rebuild.error _slimecore matches 0 run data modify storage slimecore:out rebuild.result.error.build_error set from storage slimecore:out build.result.error
execute if score *rebuild.error _slimecore matches 1 run return 0

# DEBUG
tellraw @a {text:"[ BUILD SUCCESS ]", color: green}
tellraw @a {storage:"slimecore:out", nbt:"build.result.success.order", color: green}

# set *rebuilding so './continue' runs on reload.
scoreboard players set *rebuilding _slimecore 1

data modify storage slimecore:_ v.rebuild.new_data.build set from storage slimecore:out build.result.success
data modify storage slimecore:_ v.rebuild.new_data.world set value {datapack_links:[], disabled_packs:[], aux:{datapack_link_map:{}}}
data modify storage slimecore:_ v.rebuild.new_data.world.disabled_packs set from storage slimecore:_ v.rebuild.stored_disables

# unload old build datapacks:
data modify storage slimecore:_ v.rebuild.packs set from storage slimecore:_ v.rebuild.old_data.build.packs
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/old_packs/each

# populate {..new_data.world.datapack_links}
# populate {..new_data.world.aux.datapack_link_map}
#- check missing datapack paths
data modify storage slimecore:_ v.rebuild.packs set from storage slimecore:_ v.rebuild.new_data.build.packs
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/new_packs/each
execute if score *rebuild.error _slimecore matches 1 run return 0

# SUCCESS

# populate {out -> result.success.uninstalled}
data modify storage slimecore:_ v.rebuild.uninstall_seen set value {}



# finalize:
data modify storage slimecore:data build set from storage slimecore:_ v.rebuild.new_data.build
data modify storage slimecore:data world set from storage slimecore:_ v.rebuild.new_data.world


# LEFTOFF / TODO:
#- refactor, this needs to add to an uninstalling[] and disabling[] persistent array to be used on './continue'.
#- just refactor in general, this kinda sucks.