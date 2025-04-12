#> slimecore:util > order
#--------------------
# -> strings[]: string
#--------------------
# <- result[]: string
#--------------------
# orders <strings> alphabetically according to {const.alphabet}
#--------------------
# assumes <strings> contains no duplicates.
#--------------------
# .
#--------------------

data modify storage slimecore:_ util.order.out.result set value []

scoreboard players set *order.index _slimecore 0
execute store result score *order.max_index _slimecore run data get storage slimecore:_ const.alphabet.max_index
data modify storage slimecore:_ var.order.tbd set from storage slimecore:_ util.order.in.strings

execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/eval_tbd

scoreboard players reset *order.index _slimecore
scoreboard players reset *order.max_index _slimecore
scoreboard players reset *order.reversed_val _slimecore
scoreboard players reset *order.val _slimecore
scoreboard players reset *order.has_next _slimecore
data remove storage slimecore:_ var.order
data remove storage slimecore:_ util.order.in