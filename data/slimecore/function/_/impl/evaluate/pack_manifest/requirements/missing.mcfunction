# IMPL > slimecore : evaluate/pack_manifest
# requirements/missing
#--------------------
# ./error
#--------------------

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:_ v.pack_manifest.mis_path set value "', 2:true, 3:'[', 4:true, 5:']"'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.req_path
execute store result storage slimecore:_ v.pack_manifest.mline.4 int 1 run scoreboard players get *pack_manifest.i _slimecore
function slimecore:_/util/mline/5 with storage slimecore:_ v.pack_manifest.mline

data modify storage slimecore:_ v.pack_manifest.missings set from storage slimecore:out pack_requirement.error.missing_data

execute if data storage slimecore:_ v.pack_manifest.missings[0] run function slimecore:_/impl/evaluate/pack_manifest/each_missing
