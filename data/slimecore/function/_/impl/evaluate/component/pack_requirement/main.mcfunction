# IMPL > slimecore : evaluate/component/pack_requirement
# main

# initial set:
data modify storage slimecore:out pack_requirement.value set from storage slimecore:in pack_requirement.input

# version:
data modify storage slimecore:in version.value set from storage slimecore:in pack_requirement.input.version
function slimecore:validate/component/version

data modify storage slimecore:_ v.pack_requirement.missings set from storage slimecore:out version.error.missing_data
data modify storage slimecore:_ v.pack_requirement.invalids set from storage slimecore:out version.error.invalid_data

data merge storage slimecore:_ {v:{pack_requirement:{mline:{1:'data modify storage slimecore:out pack_requirement.error.missing_data append value {key:"version.', 2:true, 3:'"}'}}}}
execute if data storage slimecore:_ v.pack_requirement.missings[0] run function slimecore:_/impl/evaluate/component/pack_requirement/each_missing

data merge storage slimecore:_ {v:{pack_requirement:{mline:{1:'data modify storage slimecore:out pack_requirement.error.invalid_data[-1].key set value "version.', 2:true, 3:'"'}}}}
execute if data storage slimecore:_ v.pack_requirement.invalids[0] run function slimecore:_/impl/evaluate/component/pack_requirement/each_invalid

# order:
data modify storage slimecore:in load_ordering.input set from storage slimecore:in pack_requirement.input.order
function slimecore:evaluate/component/load_ordering

data modify storage slimecore:out pack_requirement.value.order set from storage slimecore:out load_ordering.value
data modify storage slimecore:_ v.pack_requirement.missings set from storage slimecore:out load_ordering.error.missing_data
data modify storage slimecore:_ v.pack_requirement.invalids set from storage slimecore:out load_ordering.error.invalid_data

data merge storage slimecore:_ {v:{pack_requirement:{mline:{1:'data modify storage slimecore:out pack_requirement.error.missing_data append value {key:"order.', 2:true, 3:'"}'}}}}
execute if data storage slimecore:_ v.pack_requirement.missings[0] run function slimecore:_/impl/evaluate/component/pack_requirement/each_missing

data merge storage slimecore:_ {v:{pack_requirement:{mline:{1:'data modify storage slimecore:out pack_requirement.error.invalid_data[-1].key set value "order.', 2:true, 3:'"'}}}}
execute if data storage slimecore:_ v.pack_requirement.invalids[0] run function slimecore:_/impl/evaluate/component/pack_requirement/each_invalid

# pack & url missing:
execute unless data storage slimecore:in pack_requirement.input.pack run data modify storage slimecore:out pack_requirement.error.missing_data append value {key:'pack'}
execute unless data storage slimecore:in pack_requirement.input.url run data modify storage slimecore:out pack_requirement.error.missing_data append value {key:'url'}

execute if data storage slimecore:out pack_requirement.error run return 0

# pack validate:
data modify storage slimecore:in pack_id.value set from storage slimecore:in pack_requirement.input.pack
function slimecore:validate/component/pack_id
execute if data storage slimecore:out pack_id.error.invalid_value run data modify storage slimecore:out pack_requirement.error.invalid_data append from storage slimecore:out pack_id.error.invalid_value
execute if data storage slimecore:out pack_id.error.invalid_value run data modify storage slimecore:out pack_requirement.error.invalid_data[-1].key set value 'pack'

execute if data storage slimecore:out pack_requirement.error run return 0

return 1