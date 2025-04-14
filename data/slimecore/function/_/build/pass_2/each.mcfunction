#> slimecore:_/build/pass_2/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# DEBUG:
tellraw @a ["=== NEW :: ", {'storage':'slimecore:_', 'nbt':'var.build.this_man.pack'}]

data modify storage slimecore:_ var.build.depstack set value []
data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.this_man
function slimecore:_/build/pass_2/eval

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_2/each
