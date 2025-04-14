# slimecore:_/build/pass_2/depstack/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.this_parent set from storage slimecore:_ var.build.depstack[-1]

# DEBUG:
tellraw @a [" :: ", {'storage':'slimecore:_', 'nbt':'var.build.this_parent.root.pack'}, ": [", {'storage':'slimecore:_', 'nbt':'var.build.this_dep.pack'}, "]"]


data modify storage slimecore:_ var.build.e.depcycle append from storage slimecore:_ var.build.this_parent.root
data modify storage slimecore:_ var.build.e.check set from storage slimecore:_ var.build.this_parent.root.pack
execute store success score *x _slimecore run data modify storage slimecore:_ var.build.e.check set from storage slimecore:_ var.build.this_dep.pack
execute if score *x _slimecore matches 0 run return run function slimecore:_/build/pass_2/cycle/depstack/cycle_found

data modify storage slimecore:_ var.build.make_relation.a set from storage slimecore:_ var.build.this_parent.root.pack
data modify storage slimecore:_ var.build.make_relation.b set from storage slimecore:_ var.build.this_dep.pack

# TODO:
# this isnt right, direction should depend on the parent direction
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.load
data merge storage slimecore:_ {var:{build:{make_relation:{orderset:'load'}}}}
function slimecore:_/build/pass_2/cycle/depstack/make_relation with storage slimecore:_ var.build.make_relation
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.pre_load
data merge storage slimecore:_ {var:{build:{make_relation:{orderset:'pre_load'}}}}
function slimecore:_/build/pass_2/cycle/depstack/make_relation with storage slimecore:_ var.build.make_relation
data modify storage slimecore:_ var.build.make_relation.direction set from storage slimecore:_ var.build.this_dep.order.post_load
data merge storage slimecore:_ {var:{build:{make_relation:{orderset:'post_load'}}}}
function slimecore:_/build/pass_2/cycle/depstack/make_relation with storage slimecore:_ var.build.make_relation

execute if score *build.error _slimecore matches 1.. run return fail
data remove storage slimecore:_ var.build.depstack[-1]
execute if data storage slimecore:_ var.build.depstack[0] run function slimecore:_/build/pass_2/cycle/depstack/each