#> slimecore:_/build/second_pass/eval
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ build.this_dep set from storage slimecore:_ build.evalroot

# dependency cycle builder
data modify storage slimecore:_ build.e.depcycle set value []
data modify storage slimecore:_ build.e.depcycle append from storage slimecore:_ build.this_dep

data modify storage slimecore:_ build.xstack set from storage slimecore:_ build.depstack
execute if data storage slimecore:_ build.depstack[0] run function slimecore:_/build/second_pass/depstack/each
data modify storage slimecore:_ build.depstack set from storage slimecore:_ build.xstack

data modify storage slimecore:_ build.depstack append value {}
data modify storage slimecore:_ build.depstack[-1].root set from storage build.evalroot

# 'deps' includes deps and sups.
data modify storage slimecore:_ build.depstack[-1].deps set from storage slimecore:_ build.depstack[-1].root.dependencies
data modify storage slimecore:_ build.depstack[-1].deps append from storage slimecore:_ build.depstack[-1].root.supports[]
execute if data storage slimecore:_ build.depstack[-1].deps[0] run function slimecore:_/build/second_pass/deps/each

data remove storage slimecore:_ build.depstack[-1]

# relation: PackID -> {needed_by[]: PackID, order:{load:{pack: PackID, polarity:-1|1}, pre_load...}}
