# IMPL > slimecore:eval/build
# process
#--------------------
# ./main
#--------------------

scoreboard players set *build.error _slimecore 0

# $PackID => PackManifest ::
# (pack's id) => (its manifest)
data modify storage slimecore:_ v.build.maps.packs set value {}

# $PackID => PackManifest ::
# (abstract's source) => (abstract's id) => (its implementation's manifest)
data modify storage slimecore:_ v.build.maps.impls set value {}

# (source pack id) => (entrypoint id) => {<pack ids...>:{<ids...>:true}} (for every entrypoint that this entrypoint comes before)
data modify storage slimecore:_ v.build.maps.entrypoint_befores set value {}
data modify storage slimecore:_ v.build.maps.preload_befores set value {}

# pass 1:
#- duplicate packs
#- multiple implementations
#- populate {..maps.manifests}
#- populate {..maps.impls}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 2:
#- dependencies fulfilled
#- interfaces implemented
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 3:
#- dependency cycles
data modify storage slimecore:_ v.build.eval_seen set value {}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_3/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 4:
#- populate {..maps.entrypoint_befores}
#- populate {..maps.preload_befores}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return 0
