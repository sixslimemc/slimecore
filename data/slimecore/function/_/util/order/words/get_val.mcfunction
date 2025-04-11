#> slimecore:_/util/order/words/get_val
#--------------------
# ./each
#--------------------

$execute store result score *order.val _slimecore run data get storage slimecore:_ const.alphabet.map.'$(letter)'
scoreboard players operation *order.reversed_val _slimecore = *order.max_index _slimecore
scoreboard players operation *order.reversed_val _slimecore -= *order.val _slimecore

execute store result storage slimecore:_ var.order.reversed_val int 1 run scoreboard players get *order.reversed_val _slimecore