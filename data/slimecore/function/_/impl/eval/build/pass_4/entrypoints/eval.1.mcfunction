# IMPL > slimecore:eval/build
# pass_4/entrypoints/eval.1

$data modify storage slimecore:_ v.build.evalout set from storage slimecore:_ v.build.maps.'$(map_key)'.'$(pack_ref)'.'$(id)'
execute if data storage slimecore:_ v.build.evalout run return 0

# contains {pack_ref:PackId, id: EntrypointId | PreloadEntrypointId}
data modify storage slimecore:_ v.build.eval[-1].befores set value []

# populate implicit/explicit {...befores}:
$data modify storage slimecore:_ v.build.eval[-1].declares set from storage slimecore:_ v.build.maps.packs.'$(pack_ref)'.'$(pack_key)'
execute if data storage slimecore:_ v.build.eval[-1].declares[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/declares/each

# search for afters:
data modify storage slimecore:_ v.build.

return 1