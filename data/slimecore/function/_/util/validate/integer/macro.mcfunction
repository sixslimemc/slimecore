#> slimecore:_/util/validate/integer/macro
#--------------------
# ./main
#--------------------

$scoreboard players set *x _slimecore $(value)
execute store result storage slimecore:_ util.integer.var.x int 1 run scoreboard players get *x _slimecore
execute store success score *y _slimecore run data modify storage slimecore:_ util.integer.var.x set from storage slimecore:_ util.integer.in.value
execute if score *y _slimecore matches 1 run return 0

return 1