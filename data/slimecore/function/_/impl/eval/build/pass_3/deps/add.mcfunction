# IMPL > slimecore:eval/build
# pass_3/deps/each

$say $(parent_id) after $(dep_id)
$data modify storage slimecore:_ v.build.maps.load_afters.'$(parent_id)'.'$(dep_id)' set value true
$data modify storage slimecore:_ v.build.maps.load_afters.'$(parent_id)' merge from storage slimecore:_ v.build.maps.load_afters.'$(dep_id)'