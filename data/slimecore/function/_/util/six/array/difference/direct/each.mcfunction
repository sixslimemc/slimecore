#> slimecore:_/impl/util/six/array/difference/direct/each
#--------------------
# ./do
#--------------------

data modify storage slimecore:_ util.difference.var.a_item set from storage slimecore:_ util.difference.var.a_items[-1]

scoreboard players set *difference.found_equal _slimecore 0
data modify storage slimecore:_ util.difference.var.b_iter set from storage slimecore:_ util.difference.var.b_items
execute if data storage slimecore:_ util.difference.var.b_iter[0] run function slimecore:_/util/six/array/difference/direct/other_each

execute if score *difference.found_equal _slimecore matches 0 run data modify storage slimecore:_ util.difference.var.direct_unique append from storage slimecore:_ util.difference.var.a_item

data remove storage slimecore:_ util.difference.var.a_items[-1]
execute if data storage slimecore:_ util.difference.var.a_items[0] run function slimecore:_/util/six/array/difference/direct/each