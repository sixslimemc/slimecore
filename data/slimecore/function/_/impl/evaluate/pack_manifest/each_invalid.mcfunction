# IMPL > slimecore : evaluate/pack_manifest
# requirements/each_invalid
#--------------------
# ./main
# ./requirements/invalid
#--------------------

data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:_ v.pack_manifest.invalids[-1]

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value "', 2:true, 3:'.', 4:true, 5:'"'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.inv_path
data modify storage slimecore:_ v.pack_manifest.mline.4 set from storage slimecore:_ v.pack_manifest.invalids[-1].key
function slimecore:_/util/mline/5 with storage slimecore:_ v.pack_manifest.mline

data remove storage slimecore:_ v.pack_manifest.invalids[-1]
execute if data storage slimecore:_ v.pack_manifest.invalids[0] run function slimecore:_/impl/evaluate/pack_manifest/each_invalid