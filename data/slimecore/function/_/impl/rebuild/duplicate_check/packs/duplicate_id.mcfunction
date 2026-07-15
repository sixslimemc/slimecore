# IMPL > slimecore:rebuild
# safety_check/packs/duplicate_id
#--------------------
# ./each.1
#--------------------

data modify storage slimecore:_ x.err_entry set value {pack_id:"", packs:[]}
data modify storage slimecore:_ x.err_entry.pack_id set from storage slimecore:_ v.rebuild.this_pack.pack_id

# add all duplicates:
data modify storage slimecore:_ x.err_entry.packs append from storage slimecore:_ v.rebuild.seen_duplicate
$data modify storage slimecore:_ x.err_entry.packs append from storage slimecore:_ v.rebuild.pack_checks[{pack_id:"$(pack_id)"}]

# set out:
data modify storage slimecore:out rebuild.result.error.safe_mode_activated.duplicate_installed_pack_ids append from storage slimecore:_ x.err_entry
scoreboard players set *rebuild.unsafe _slimecore 1

# remove duplicates from iteration (excluding current iter, will be removed automatically):
data remove storage slimecore:_ v.rebuild.pack_checks[-1].pack_id
$data remove storage slimecore:_ v.rebuild.pack_checks[{pack_id:"$(pack_id)"}]