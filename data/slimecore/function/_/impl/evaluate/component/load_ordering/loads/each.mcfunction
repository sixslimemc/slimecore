# IMPL > slimecore : evaluate/component/load_ordering
# / loads/each
#--------------------
# main
#--------------------

data modify storage slimecore:_ v.load_ordering.this_load set from storage slimecore:_ v.load_ordering.loads[-1]

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/load_ordering/loads/eval with storage slimecore:_ v.load_ordering

execute if score *x _slimecore matches -1 run data modify storage slimecore:out load_ordering.error.missing_data append value {field:''}
execute if score *x _slimecore matches -1 run data modify storage slimecore:out load_ordering.error.missing_data[-1].field set from storage slimecore:_ v.load_ordering.this_load

execute if score *x _slimecore matches -2 run data modify storage slimecore:out load_ordering.error.invalid_data append from storage slimecore:out relative_order.error.invalid_value
execute if score *x _slimecore matches -2 run data modify storage slimecore:out load_ordering.error.invalid_data[-1].field set from storage slimecore:_ v.load_ordering.this_load

data remove storage slimecore:_ v.load_ordering.loads[-1]
execute if data storage slimecore:_ v.load_ordering.loads[0] run function slimecore:_/impl/evaluate/component/load_ordering/loads/each