#> slimecore:build/main
#--------------------
# ../init
#--------------------

# INPUTS {build.in}:
# -> manifests[]: PackInfo

# OUTPUTS: {build.out}
# <- 

data remove storage slimecore:_ var.build.error
scoreboard players set *build.error _slimecore 0
# *build.error should be 1 if any data is contained in {build.error}
# see ./end/error for error data format.

# PackID => PackInfo :
data modify storage slimecore:_ var.build.maps.manifests set value {}

# PackID => LoadSpec<[]{pack: PackID, direction: LoadOrderRequirement}> :
data modify storage slimecore:_ var.build.maps.relations set value {}

# TODO:
#- dependency installed checking
#- load ordering

# pass 1:
#- check duplicate packs
#- check multiple implementations
#- populate {..maps.manifests}
data modify storage slimecore:_ var.build.seen_impls set value {}
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ build.in.manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_1/each
execute if score *build.error _slimecore matches 1 run return run function slimecore:_/build/end/error

# pass 2:
#- dependency cycles
#- load order validation
#- populate {..maps.relations}
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ build.in.manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return run function slimecore:_/build/end/error

# pass 3:
#- check for all installed dependencies
