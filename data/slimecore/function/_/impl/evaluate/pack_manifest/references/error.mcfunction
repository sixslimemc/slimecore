# IMPL > slimecore : evaluate/pack_manifest
# ref/error
#--------------------
# ./error
#--------------------

data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out pack_reference.error.invalid_data[-1]

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value "', 2:true, 3:'[', 4:true, 5:']"'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.ref_path
execute store result storage slimecore:_ v.pack_manifest.mline.4 int 1 run scoreboard players get *pack_manifest.i _slimecore
function slimecore:_/util/mline/5 with storage slimecore:_ v.pack_manifest.mline