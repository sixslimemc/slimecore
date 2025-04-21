#> slimecore:_/impl/util/six/array/intersection/each_match
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ util.intersection.var.b_item set from storage slimecore:_ util.intersection.var.matches[-1]

data modify storage slimecore:_ util.partial.in.object set from storage slimecore:_ util.intersection.var.b_item
data modify storage slimecore:_ util.partial.in.get set from storage slimecore:_ util.intersection.in.compare
function slimecore:_/util/six/object/partial/main

data modify storage slimecore:_ util.equal.in.a set from storage slimecore:_ util.intersection.var.a_compare
data modify storage slimecore:_ util.equal.in.b set from storage slimecore:_ util.partial.out.result

execute if function slimecore:_/util/six/object/equal/main run return run function slimecore:_/util/six/array/intersection/add_match with storage slimecore:_ util.intersection.var

data remove storage slimecore:_ util.intersection.var.matches[-1]
execute if data storage slimecore:_ util.intersection.var.matches[0] run function slimecore:_/util/six/array/intersection/each_match