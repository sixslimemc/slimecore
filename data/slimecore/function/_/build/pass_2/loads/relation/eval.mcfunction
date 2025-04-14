#> slimecore:_/build/pass_2/relation/eval
#--------------------
# ./each
#--------------------

# WITH {.build}
# $ this_load

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.evalroot

data remove storage slimecore:_ var.build.dep_direction
$data modify storage slimecore:_ var.build.dep_direction set from storage slimecore:_ var.build.this_dep.order.'$(this_load)'

# make relations:
data modify storage slimecore:_ var.build.xstack set from storage slimecore:_ var.build.relstack
execute if data storage slimecore:_ var.build.relstack[0] run function slimecore:_/build/pass_2/loads/relation/relstack/each
data modify storage slimecore:_ var.build.relstack set from storage slimecore:_ var.build.xstack

# add to relstack:
data modify storage slimecore:_ var.build.relstack append value {}
data modify storage slimecore:_ var.build.relstack[-1].root set from storage slimecore:_ var.build.this_dep

# get deps:
execute unless data storage slimecore:_ var.build.this_dep.order run function slimecore:_/build/pass_2/loads/relation/get_first_deps with storage slimecore:_ var.build.this_dep
execute if data storage slimecore:_ var.build.this_dep.order run function slimecore:_/build/pass_2/loads/relation/get_deps with storage slimecore:_ var.build.this_dep

# eval matching deps:
execute if data storage slimecore:_ var.build.relstack[-1].deps[0] run function slimecore:_/build/pass_2/loads/relation/deps/each

data remove storage slimecore:_ var.build.relstack[-1]
