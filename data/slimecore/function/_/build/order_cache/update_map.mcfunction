#> slimecore:_/build/order_cache/update_map
#--------------------
# ./each
#--------------------

data merge storage slimecore:_ {var:{build:{entry:{}}}}
data modify storage slimecore:_ var.build.entry.pack set from storage slimecore:_ var.build.this_pack
execute store result storage slimecore:_ var.build.entry.index int 1 run scoreboard players get *i _slimecore
$data modify storage slimecore:_ var.build.inital_order_map.'$(this_pack)' set from storage slimecore:_ var.build.entry