#> slimecore : evaluate/component/relative_order/get_value
#--------------------
# ./main
#--------------------

$data modify storage slimecore:out relative_order.value set from storage slimecore:_ validation.relative_order.map.'$(input)'
return 1