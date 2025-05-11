#> slimecore : evaluate/component/relative_order :: MAIN

# success:
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/component/relative_order/get_value with storage slimecore:in relative_order
execute if score *x _slimecore matches 1 run return 1

# invalid:
data merge storage slimecore:out {relative_order:{error:{invalid_value:{expected:"'BEFORE' | 'ANY' | 'AFTER' | 1 | 0 | -1"}}}}
data modify storage slimecore:out relative_order.error.invalid_value.got set from storage slimecore:in relative_order.input
return 0