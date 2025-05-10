# IMPL > slimecore : evaluate/pack_manifest
# requirements/each_invalid
#--------------------
# ./error
#--------------------

data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out pack_requirement.error.invalid_data[-1]

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value "', 2:true, 3:'[', 4:true, 5:'].', 6:true, 7:'"'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.req_path
execute store result storage slimecore:_ v.pack_manifest.mline.4 int 1 run scoreboard players get *pack_manifest.i _slimecore
data modify storage slimecore:_ v.pack_manifest.mline.6 set from storage slimecore:out pack_requirement.error.invalid_data[-1].key
function slimecore:_/util/mline/7 with storage slimecore:_ v.pack_manifest.mline

data remove storage slimecore:out pack_requirement.error.invalid_data[-1]
execute if data storage slimecore:out pack_requirement.error.invalid_data[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each_invalid