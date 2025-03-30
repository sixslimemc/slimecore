# slimecore:_/build/second_pass/depstack/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ build.this_parent set from storage slimecore:_ build.xstack[-1]

data modify storage slimecore:_ build.e.depcycle append from storage slimecore:_ build.this_parent
data modify storage slimecore:_ build.e.check set from storage slimecore:_ build.this_parent.pack
execute store success score *c _slimecore run data modify storage slimecore:_ build.e.check set from storage slimecore:_ build.this_dep.pack
execute if score *c _slimecore matches 0 run function slimecore:_/build/second_pass/depstack/cycle_found

data remove storage slimecore:_ build.xstack[-1]
execute if data storage slimecore:_ build.xstack[0] run function slimecore:_/build/second_pass/depstack/each