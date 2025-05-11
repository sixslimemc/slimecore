# IMPL > slimecore : evaluate/pack_manifest
# each_dupe_check


data remove storage slimecore:_ v.pack_manifest.dupe
data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'return run data modify storage slimecore:_ v.pack_manifest.dupe.pack set from storage slimecore:_ v.pack_manifest.dupe_seen[{pack:"', 2:true, 3:'"}]'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.dupe_checks[-1].pack
execute store success score *x _slimecore run function slimecore:_/util/mline/3 with storage slimecore:_ v.pack_manifest.mline

execute if score *x _slimecore matches 1 run data modify storage slimecore:_ v.pack_manifest.dupes append from storage slimecore:_ v.pack_manifest.dupe

execute if score *x _slimecore matches 0 run data modify storage slimecore:_ v.pack_manifest.dupe_seen append value {pack:''}
execute if score *x _slimecore matches 0 run data modify storage slimecore:_ v.pack_manifest.dupe_seen[-1].pack set from storage slimecore:_ v.pack_manifest.dupe_checks[-1].pack

data remove storage slimecore:_ v.pack_manifest.dupe_checks[-1]
execute if data storage slimecore:_ v.pack_manifest.dupe_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/each_dupe_check