# IMPL > slimecore:eval/build
# pass_1/populate_dependents

$data modify storage slimecore:_ v.build.maps.dependents.'$(pack_id)' set value []
$data modify storage slimecore:_ v.build.maps.dependents.'$(pack_id)' append from storage slimecore:in build.packs[{dependencies:[{pack_id:"$(pack_id)", author_id:"$(author_id)"}]}]
