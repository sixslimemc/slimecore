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

# init:
data remove storage slimecore:_ build.out
scoreboard players set *build.error _slimecore 0

# PackID => PackInfo ::
# (pack's id) => (its manifest)
data modify storage slimecore:_ var.build.maps.manifests set value {}

# PackID => PackInfo ::
# (abstract's id) => (its implementation's manifest)
data modify storage slimecore:_ var.build.maps.impls set value {}

# PackID => LoadSpec<[]{pack: PackID, direction: LoadOrderRequirement}> ::
# (pack's id) => (its relations to other packs)
data modify storage slimecore:_ var.build.maps.relations set value {}

# LoadSpec<[]PackID> ::
data modify storage slimecore:_ var.build.final_order set value {load:[], pre_load:[], post_load:[]}

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

# initial load order (alphabetical):
data merge storage slimecore:_ {util:{order:{in:{strings:[]}}}}
data modify storage slimecore:_ util.order.in.strings append from storage slimecore:_ build.in.manifests[].pack
function slimecore:_/util/order/main
data modify storage slimecore:_ var.build.initial_order set from storage slimecore:_ util.order.out.result

# DEBUG:
tellraw @a ["INITIAL ORDER: ", {'storage':'slimecore:_', 'nbt':'var.build.initial_order'}]

# DEBUG:
tellraw @a ["RELATIONS: ", {'storage':'slimecore:_', 'nbt':'var.build.maps.relations'}]
# pass order:
#- relational ordering
#- populate {..final_order}
data modify storage slimecore:_ var.build.order_iter set from storage slimecore:_ var.build.initial_order
scoreboard players set *build.order_ptr _slimecore 0
execute if data storage slimecore:_ var.build.order_iter[0] run function slimecore:_/build/pass_order/each

# ASSERT) *build.error != 1

return run function slimecore:_/build/end/success