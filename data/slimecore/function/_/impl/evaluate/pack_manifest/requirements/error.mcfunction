# IMPL > slimecore : evaluate/pack_manifest
# requirements/error
#--------------------
# ./each
#--------------------

execute if data storage slimecore:out pack_requirement.error.missing_data[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each_missing

execute if data storage slimecore:out pack_requirement.error.invalid_data[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each_invalid