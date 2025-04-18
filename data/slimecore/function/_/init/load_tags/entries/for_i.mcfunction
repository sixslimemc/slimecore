#> slimecore:_/init/load_tags/entries/each
#--------------------
# ../each
#--------------------

$data modify storage slimecore:_ var.init.this_pack set from storage slimecore:_ var.init.load_order[$(i)].pack

function slimecore:_/init/load_tags/entries/call_tag with storage slimecore:_ var.init

scoreboard players add *i _slimecore 1
execute store result storage slimecore:_ var.init.i int 1 run scoreboard players get *i _slimecore
execute if score *i _slimecore < *ix _slimecore run function slimecore:_/init/load_tags/entries/for_i with storage slimecore:_ var.init