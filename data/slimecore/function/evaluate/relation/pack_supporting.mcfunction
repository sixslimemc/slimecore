#> slimecore : evaluate/relation/pack_supporting
#--------------------
# -> build: Build
# -> for: PackReference
#--------------------
# <- result[]: PackReference
#--------------------
# TODO: description
#--------------------
# 1: <build> contains <for>; successfully retrieved installed supports.
# 0: <build> does not contain <for>.
#--------------------

data remove storage slimecore:out pack_supporting

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/relation/pack_supporting/main

data remove storage slimecore:_ v.pack_supporting
data remove storage slimecore:in pack_supporting

return run scoreboard players get *x _slimecore