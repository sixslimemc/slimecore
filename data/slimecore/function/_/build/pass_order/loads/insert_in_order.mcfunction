#> slimecore:_/build/pass_order/loads/get_m
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ var.build.final_order.'$(this_load)' insert $(insertion_index) value {pack:'$(this_pack)'}