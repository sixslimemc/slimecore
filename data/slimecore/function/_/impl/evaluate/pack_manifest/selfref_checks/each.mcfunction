# IMPL > slimecore : evaluate/pack_manifest
# selfref_checks/each

scoreboard players remove *pack_manifest.i _slimecore 1

# check:
data modify storage slimecore:_ v.pack_manifest.x set from storage slimecore:in pack_manifest.input.pack
execute store success score *x _slimecore run data modify storage slimecore:_ v.pack_manifest.x set from storage slimecore:_ v.pack_manifest.selfref_checks[-1].pack

# found:
execute if score *x _slimecore matches 0 run function slimecore:_/impl/evaluate/pack_manifest/selfref_checks/found

data remove storage slimecore:_ v.pack_manifest.selfref_checks[-1]
execute if data storage slimecore:_ v.pack_manifest.selfref_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/selfref_checks/each