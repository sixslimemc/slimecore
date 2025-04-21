#> slimecore:_/impl/util/six/array/difference/direct/b_each
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ util.difference.var.b_item set from storage slimecore:_ util.difference.var.b_iter[-1]

# DEBUG:
tellraw @a ["o: ", {'storage':'slimecore:_', 'nbt':'util.difference.var.a_item'}, " - ", {'storage':'slimecore:_', 'nbt':'util.difference.var.b_item'}]
execute store success score *x _slimecore run data modify storage slimecore:_ util.difference.var.b_item set from storage slimecore:_ util.difference.var.a_item

execute if score *x _slimecore matches 0 run return run scoreboard players set *difference.found_equal _slimecore 1

data remove storage slimecore:_ util.difference.var.b_iter[-1]
execute if data storage slimecore:_ util.difference.var.b_iter[0] run function slimecore:_/util/six/array/difference/direct/other_each