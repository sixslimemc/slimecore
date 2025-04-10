# slimecore:_/build/second_pass/depstack/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.this_parent set from storage slimecore:_ var.build.depstack[-1]

data modify storage slimecore:_ var.build.e.depcycle append from storage slimecore:_ var.build.this_parent
data modify storage slimecore:_ var.build.e.check set from storage slimecore:_ var.build.this_parent.pack
execute store success score *x _slimecore run data modify storage slimecore:_ var.build.e.check set from storage slimecore:_ var.build.this_dep.pack
execute if score *x _slimecore matches 0 run function slimecore:_/build/second_pass/depstack/cycle_found

data modify storage slimecore:_ var.build.make_relation.a set from storage slimecore:_ var.build.this_parent.pack
data modify storage slimecore:_ var.build.make_relation.b set from storage slimecore:_ var.build.this_dep.pack

data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.load
data merge storage slimecore:_ {build:{make_relation:{orderset:'load'}}}
function slimecore:_/build/second_pass/depstack/make_relation with storage slimecore:_ var.build.make_relation
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.pre_load
data merge storage slimecore:_ {build:{make_relation:{orderset:'pre_load'}}}
function slimecore:_/build/second_pass/depstack/make_relation with storage slimecore:_ var.build.make_relation
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.post_load
data merge storage slimecore:_ {build:{make_relation:{orderset:'post_load'}}}
function slimecore:_/build/second_pass/depstack/make_relation with storage slimecore:_ var.build.make_relation

data remove storage slimecore:_ var.build.depstack[-1]
execute if data storage slimecore:_ var.build.depstack[0] run function slimecore:_/build/second_pass/depstack/each