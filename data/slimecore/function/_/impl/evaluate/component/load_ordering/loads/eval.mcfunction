# IMPL > slimecore : evaluate/component/load_ordering
# / loads/eval
#--------------------
# ./each
#--------------------

data remove storage slimecore:_ v.load_ordering.order
$data modify storage slimecore:_ v.load_ordering.order set from storage slimecore:_ v.load_ordering.in.'$(this_load)'
execute unless data storage slimecore:_ v.load_ordering.order run return -1

data modify storage slimecore:in relative_order.input set from storage slimecore:_ v.load_ordering.order
function slimecore:evaluate/component/relative_order

execute if data storage slimecore:out relative_order.error.invalid_value run return -2

$data modify storage slimecore:out load_ordering.value.'$(this_load)' set from storage slimecore:out relative_order.value
return 1