# IMPL > slimecore:eval/build
# pass_1/try_add

data remove storage slimecore:_ v.build.seen_pack
$data modify storage slimecore:_ v.build.seen_pack set from storage slimecore:_ v.build.maps.packs.'$(pack_id)'

#DEBUG:
$tell @a $(pack_id)

$data modify storage slimecore:_ v.build.maps.packs.'$(pack_id)' set from storage slimecore:_ v.build.this_pack
execute if data storage slimecore:_ v.build.seen_pack run function slimecore:_/impl/eval/build/pass_1/duplicate with storage slimecore:_ v.build.this_pack