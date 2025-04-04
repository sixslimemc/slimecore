#> slimecore:build/start
#--------------------
# ../init
#--------------------


data remove storage slimecore:_ build.errors
scoreboard players set *build.error _slimecore 0
# error codes (in build.errors)
# 1 - duplicate packs
#- duplicates[]: PackInfo
# 2 - dependency cycle
#- dependency_cycles: { root: PackInfo, cycle[]: PackID }
# 3 - conflicting dependency order
#- let &Conflict: {a: PackID, b: PackID}
#- relations: {load[]: &Conflict, pre_load[]: &Conflict, post_load[]: &Conflict}


# duplicate check
# packmap creation
# TODO:
# packs cannot specify the same pack as both a support and a dependecy
# packs cannot have implements that are not included in either their supports or dependencies
# packs must have all data, and no invalid data
# abstracts must only be implemented once
data modify storage slimecore:_ build.pmap.manifests set value {}

data modify storage slimecore:_ build.manifests set from storage slimecore:_ init.manifests
execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/first_pass/each

execute if score *build.error _slimecore matches 1.. run return run function slimecore:_/build/end/error

# ordering check
data modify storage slimecore:_ build.pmap.relations set value {}

data modify storage slimecore:_ build.manifests set from storage slimecore:_ init.manifests
execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/second_pass/each
