#> slimecore:build/start
#--------------------
# ../init
#--------------------


data remove storage slimecore:_ var.build.error
scoreboard players set *build.error _slimecore 0
# if any of these exist in {build.error}, *build.error should be 1:
#- duplicates[]: {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]: {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]: { root: PackInfo, cycle[]: PackID }
#- relations: {load[]: &Conflict, pre_load[]: &Conflict, post_load[]: &Conflict}
#-- where &Conflict := {a: PackID, b: PackID}

# duplicate check
# packmap creation
# TODO:
#- abstracts must only be implemented once


# PackID => PackInfo :
data modify storage slimecore:_ var.build.pmap.manifests set value {}

# first pass:
#- check duplicate packs
#- check multiple implementations
#- populate {..pmap.manifests}
data modify storage slimecore:_ var.build.seen_impls set value {}
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/first_pass/each

execute if score *build.error _slimecore matches 1.. run return run function slimecore:_/build/end/error

# PackID => LoadSpec<[]{pack: PackID, direction: LoadOrderRequirement}> :
data modify storage slimecore:_ var.build.pmap.relations set value {}

data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/second_pass/each
