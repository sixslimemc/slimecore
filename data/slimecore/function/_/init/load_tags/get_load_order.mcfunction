#> slimecore:_/init/load_tags/each
#--------------------
# ../main
#--------------------

$data modify storage slimecore:_ var.init.load_order set from storage slimecore:data current_build.order.'$(this_load)'
