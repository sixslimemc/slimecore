# IMPL > slimecore:eval/build
# pass_1/impls/try_add

data remove storage slimecore:_ v.build.seen_impl
$data modify storage slimecore:_ v.build.seen_impl set from storage slimecore:_ v.build.maps.impls.'$(pack_ref)'.'$(id)'

$data modify storage slimecore:_ v.build.maps.impls.'$(pack_ref)'.'$(id)' set from storage slimecore:_ v.build.this_pack

# already seen (multiple_implementations error):
execute if data storage slimecore:_ v.build.seen_impl run return run function slimecore:_/impl/eval/build/pass_1/impls/multiple with storage slimecore:_ v.build.this_impl