# IMPL > slimecore : evaluate/pack_manifest
# requirements/error
#--------------------
# ./each
#--------------------

execute if data storage slimecore:out pack_requirement.error.missing_data run function slimecore:_/impl/evaluate/pack_manifest/requirements/missing

execute if data storage slimecore:out pack_requirement.error.invalid_data run function slimecore:_/impl/evaluate/pack_manifest/requirements/invalid