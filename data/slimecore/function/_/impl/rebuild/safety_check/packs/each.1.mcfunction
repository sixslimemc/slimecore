# IMPL > slimecore:rebuild
# safety_check/packs/each.1

# return if duplicate:
data remove storage slimecore:_ v.rebuild.seen_duplicate
$data modify storage slimecore:_ v.rebuild.seen_duplicate set from storage slimecore:_ v.rebuild.pack_seen_map.'$(pack_id)' 
execute if data storage slimecore:_ v.rebuild.seen_duplicate run return run function slimecore:_/impl/rebuild/safety_check/packs/duplicate_id with storage slimecore:_ v.rebuild.this_pack

# set seen if not:
$data modify storage slimecore:_ v.rebuild.pack_seen_map.'$(pack_id)' set from storage slimecore:_ v.rebuild.this_pack
