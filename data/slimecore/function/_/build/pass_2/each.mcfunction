#> slimecore:_/build/pass_2/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# DEBUG:
tellraw @a ["=====[ ", {'storage':'slimecore:_', 'nbt':'var.build.this_man.pack'}, " ]====="]

data modify storage slimecore:_ var.build.depstack set value []
data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.this_man
function slimecore:_/build/pass_2/cycle/eval

data modify storage slimecore:_ var.build.relstack set value []
data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.this_man
function slimecore:_/build/pass_2/relation/eval

execute if score *build.error _slimecore matches 1.. run return fail
data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_2/each
