# slimecore:_/build/second_pass/depstack/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ build.this_parent set from storage slimecore:_ build.depstack[-1]

data modify storage slimecore:_ build.e.depcycle append from storage slimecore:_ build.this_parent
data modify storage slimecore:_ build.e.check set from storage slimecore:_ build.this_parent.pack
execute store success score *c _slimecore run data modify storage slimecore:_ build.e.check set from storage slimecore:_ build.this_dep.pack
execute if score *c _slimecore matches 0 run function slimecore:_/build/second_pass/depstack/cycle_found

data modify storage slimecore:_ build.relation.dep set from storage slimecore:_ build.this_dep.pack
data modify storage slimecore:_ build.relation.parent set from storage slimecore:_ build.this_parent.pack
function slimecore:_/build/second_pass/depstack/relation with storage slimecore:_ build.relation

data remove storage slimecore:_ build.depstack[-1]
execute if data storage slimecore:_ build.depstack[0] run function slimecore:_/build/second_pass/depstack/each