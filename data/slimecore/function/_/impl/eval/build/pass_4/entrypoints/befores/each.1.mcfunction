# IMPL > slimecore:eval/build
# pass_4/entrypoints/befores/each.1

$data modify storage slimecore:_ v.build.eval[-1].out.'$(target_pack_id)'.'$(target_id)' set value true
data modify storage slimecore:_ v.build.eval[-1].out merge from storage slimecore:_ v.build.eval[-1].merging
$data modify storage slimecore:_ v.build.maps.'$(map_key)'.'$(source_pack_id)'.'$(source_id)' set from storage slimecore:_ v.build.eval[-1].out