# IMPL > slimecore : validate/component/int
# main

$scoreboard players set *x _slimecore $(value)
execute store result storage slimecore:_ v.int.x int 1 run scoreboard players get *x _slimecore
execute store success score *y _slimecore run data modify storage slimecore:_ v.int.x set from storage slimecore:in int.value
execute if score *y _slimecore matches 1 run return 0

return 1