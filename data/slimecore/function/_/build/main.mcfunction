#> slimecore:build/main
#--------------------
# ../init
#--------------------

# INPUTS {build.in}:
# -> manifests[]: PackInfo

# OUTPUTS: {build.out}
# & Conflict := {a: PackID, b: PackID}
# & BadVersionInfo := {installed: PackInfo, version_index: 0b | 1b (major | minor)}
# <- result? {order: LoadSpec<[]PackID>, pack_map: PackID => PackInfo}
# <- error? {
#- duplicates[]: {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]: {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]: { root: PackInfo, cycle[]: PackID }
#- relations: LoadSpec<[]&Conflict>
#- missing_dependencies[]: {dependency: PackRequirement, dependent: PackInfo, bad_version? &BadVersionInfo}
#- missing_implementations[]: {manifest: PackInfo}
# }

# RETURNS:
# 1 - build success, {build.out.result} populated.
# 0 - build failure, {build.out.error} populated.

# *build.error should be set to 1 if any data is contained in {build.error}
# see ./end/error for error data format.

data remove storage slimecore:_ var.build.error
scoreboard players set *build.error _slimecore 0

# PackID => PackInfo :
# (pack's id) => (its manifest)
data modify storage slimecore:_ var.build.maps.manifests set value {}

# PackID => PackInfo :
# (abstract's id) => (its implementation's manifest)
data modify storage slimecore:_ var.build.maps.impls set value {}

# PackID => LoadSpec<[]{pack: PackID, direction: LoadOrderRequirement}> :
# (pack's id) => (its relations to other packs)
data modify storage slimecore:_ var.build.maps.relations set value {}

# pass 1:
#- duplicate packs
#- multiple implementations
#- populate {..maps.manifests}
#- populate {..maps.impls}
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
#- all dependencies fulfilled
#- all abstracts implemented
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ build.in.manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_3/each
execute if score *build.error _slimecore matches 1 run return run function slimecore:_/build/end/error

# pass 4:
#- initial ordering
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ build.in.manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_4/each
execute if score *build.error _slimecore matches 1 run return run function slimecore:_/build/end/error

# TODO: the fucking alphabetical ordering
# TODO: implement
# pass 5:
#- relationship ordering
data modify storage slimecore:_ var.build.manifests set from storage slimecore:_ build.in.manifests
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_4/each
execute if score *build.error _slimecore matches 1 run return run function slimecore:_/build/end/error
