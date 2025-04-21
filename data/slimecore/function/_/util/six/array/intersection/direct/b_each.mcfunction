#> slimecore:_/impl/util/six/array/intersection/direct/b_each
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ util.intersection.var.b_item set from storage slimecore:_ util.intersection.var.b_iter[-1]

execute store success score *x _slimecore run data modify storage slimecore:_ util.intersection.var.b_item set from storage slimecore:_ util.intersection.var.a_item

execute if score *x _slimecore matches 0 run return run data modify storage slimecore:_ util.intersection.out.shared append from storage slimecore:_ util.intersection.var.a_item

data remove storage slimecore:_ util.intersection.var.b_iter[-1]
execute if data storage slimecore:_ util.intersection.var.b_iter[0] run function slimecore:_/util/six/array/intersection/direct/b_each