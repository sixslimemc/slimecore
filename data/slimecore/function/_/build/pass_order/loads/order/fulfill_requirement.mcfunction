#> slimecore:_/build/pass_order/loads/order/fulfill_requirement
#--------------------
# ./each
#--------------------

$data remove storage slimecore:_ var.build.required_before[{pack:'$(this_order_entry)'}]