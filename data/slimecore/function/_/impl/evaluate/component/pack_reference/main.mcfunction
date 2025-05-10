# IMPL > slimecore : evaluate/component/pack_reference
# main

# shortform:
data modify storage slimecore:in pack_id.value set from storage slimecore:in pack_reference.input
execute store result score *x _slimecore run function slimecore:validate/pack_id

execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_reference.value.pack set from storage slimecore:in pack_reference.input
execute if score *x _slimecore matches 1 run return 1

execute unless data storage slimecore:in pack_reference.input.pack run return 0

# fullform:
data modify storage slimecore:in pack_id.value set from storage slimecore:in pack_reference.input.pack
execute store result score *x _slimecore run function slimecore:validate/pack_id

execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_reference.value.pack set from storage slimecore:in pack_reference.input.pack
execute if score *x _slimecore matches 1 run return 1

return 0