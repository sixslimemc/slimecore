#> slimecore:_/init/load_tags/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.init.this_load set from storage slimecore:_ var.init.load_tags[-1].word
data modify storage slimecore:_ var.init.this_tag set from storage slimecore:_ var.init.load_tags[-1].tag

# get load order:
data merge storage slimecore:_ {var:{init:{load_order:[]}}}
function slimecore:_/init/load_tags/get_load_order with storage slimecore:_ var.init

# run tags:
execute store result score *ix _slimecore if data storage slimecore:_ var.init.load_order[]
scoreboard players set *i _slimecore 0
execute store result storage slimecore:_ var.init.i int 1 run scoreboard players get *i _slimecore
execute if score *i _slimecore < *ix _slimecore run function slimecore:_/init/load_tags/entries/for_i with storage slimecore:_ var.init

data remove storage slimecore:_ var.init.load_tags[-1]
execute if data storage slimecore:_ var.init.load_tags[0] run function slimecore:_/init/load_tags/each