# IMPL > slimecore:eval/build
# pass_1/duplicate

data modify storage slimecore:out build.result.error.duplicate_pack_ids append value {pack_id:"", packs:[{}]}
data modify storage slimecore:out build.result.error.duplicate_pack_ids[-1].pack_id set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:out build.result.error.duplicate_pack_ids[-1].packs[0] set from storage slimecore:_ v.build.seen_pack
