# IMPL > slimecore:eval/build
# process

scoreboard players set *build.error _slimecore 0

# $PackID => PackManifest ::
# (pack's id) => (its manifest)
data modify storage slimecore:_ v.build.maps.packs set value {}

# $PackID => PackManifest ::
# (abstract's id) => (its implementation's manifest)
data modify storage slimecore:_ v.build.maps.impls set value {}

# $PackID => LoadWords<[]{pack: $PackID, direction: RelativeOrder}> ::
# (pack's id) => (its relations to other packs)
data modify storage slimecore:_ v.build.maps.relations set value {}

# LoadWords<[]$PackID> ::
data modify storage slimecore:_ v.build.final_order set value {}

# pass 1:
#- duplicate packs
#- multiple implementations
#- populate {..maps.manifests}
#- populate {..maps.impls}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
execute if score *build.error _slimecore matches 1 run return 0