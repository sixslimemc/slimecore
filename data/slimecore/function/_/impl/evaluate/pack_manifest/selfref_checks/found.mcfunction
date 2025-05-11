# IMPL > slimecore : evaluate/pack_manifest
# selfref_checks/found

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:\'', 2:true, 3:'[', 4:true, 5:'].pack\', expected:\'non self-reference (', 6:true, 7:')\', got:', 8:true, 9:'}'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.selfref_path
execute store result storage slimecore:_ v.pack_manifest.mline.4 int 1 run scoreboard players get *pack_manifest.i _slimecore
data modify storage slimecore:_ v.pack_manifest.mline.6 set from storage slimecore:in pack_manifest.input.pack
data modify storage slimecore:_ v.pack_manifest.mline.8 set from storage slimecore:_ v.pack_manifest.selfref_checks[-1]
function slimecore:_/util/mline/9 with storage slimecore:_ v.pack_manifest.mline