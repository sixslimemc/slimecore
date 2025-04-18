# slimecore:_/build/pass_2/depstack/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.this_parent set from storage slimecore:_ var.build.relstack[-1]

data modify storage slimecore:_ var.build.make_relation.a set from storage slimecore:_ var.build.this_parent.root.pack
data modify storage slimecore:_ var.build.make_relation.b set from storage slimecore:_ var.build.this_dep.pack
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.dep_direction
data modify storage slimecore:_ var.build.make_relation.orderset set from storage slimecore:_ var.build.this_load
function slimecore:_/build/pass_2/loads/relation/relstack/make_relation with storage slimecore:_ var.build.make_relation

execute if score *build.error _slimecore matches 1.. run return fail
data remove storage slimecore:_ var.build.relstack[-1]
execute if data storage slimecore:_ var.build.relstack[0] run function slimecore:_/build/pass_2/loads/relation/relstack/each