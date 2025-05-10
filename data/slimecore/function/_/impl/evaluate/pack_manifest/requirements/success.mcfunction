# IMPL > slimecore : evaluate/pack_manifest
# requirements/success
#--------------------
# ./each
#--------------------

data merge storage slimecore:_ {v:{pack_manifest:{mline:{1:'data modify storage slimecore:out pack_manifest.value.', 2:true, 3:' append from storage slimecore:out pack_requirement.value'}}}}
data modify storage slimecore:_ v.pack_manifest.mline.2 set from storage slimecore:_ v.pack_manifest.req_path
function slimecore:_/util/mline/3 with storage slimecore:_ v.pack_manifest.mline