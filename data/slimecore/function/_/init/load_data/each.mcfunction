#> slimecore:_/init/load_data/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.init.this_man set from storage slimecore:_ var.init.pack_iter[-1]

data modify storage slimecore:in pack_supporting.build set from storage slimecore:data current_build
data modify storage slimecore:in pack_supporting.for.pack set from storage slimecore:_ var.init.this_man.pack
function slimecore:evaluate/relation/pack_supporting

data merge storage slimecore:_ {x:{mline:{1:"data modify storage slimecore:_ var.init.load_data.'", 2:false, 3:"'.supporting set from storage slimecore:out pack_supporting.result"}}}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ var.init.this_man.pack
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

data remove storage slimecore:_ var.init.pack_iter[-1]
execute if data storage slimecore:_ var.init.pack_iter[0] run function slimecore:_/init/load_data/each