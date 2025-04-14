#> slimecore:_/build/pass_order/loads/get_m
#--------------------
# ./each
#--------------------

# only gets relations where 'this_pack' needs to be before the related pack
data merge storage slimecore:_ {var:{build:{required_before:[]}}}
$data modify storage slimecore:_ var.build.required_before append from storage slimecore:_ var.build.maps.relations.'$(this_pack)'.'$(this_load)'[{direction:1b}]
data remove storage slimecore:_ var.build.required_before[].direction

$data modify storage slimecore:_ var.build.current_order set from storage slimecore:_ var.build.final_order.'$(this_load)'