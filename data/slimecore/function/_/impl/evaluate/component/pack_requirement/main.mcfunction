# IMPL > slimecore : evaluate/component/pack_requirement
# main

execute unless data storage slimecore:in pack_requirement.input.pack run data modify storage slimecore:out pack_requirement.error.missing_data append value {key:'pack'}
execute unless data storage slimecore:in pack_requirement.input.url run data modify storage slimecore:out pack_requirement.error.missing_data append value {key:'url'}

data modify storage slimecore: set from storage <namespace:id> <path>