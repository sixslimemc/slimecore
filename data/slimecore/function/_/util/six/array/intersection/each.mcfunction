#> six:_/impl/array/set/intersection/each
#--------------------
# @api
#--------------------

data modify storage slimecore:_ util.intersection.var.a_item set from storage slimecore:_ util.intersection.in.a[-1]

data modify storage slimecore:_ util.partial.in.object set from storage slimecore:_ util.intersection.var.a_item
data modify storage slimecore:_ util.partial.in.get set from storage slimecore:_ util.intersection.in.compare
function slimecore:_/util/six/object/partial/main

data modify storage slimecore:_ util.intersection.var.a_compare set from storage slimecore:_ util.partial.out.result
data modify storage slimecore:_ util.intersection.var.matches set value []
function slimecore:_/util/six/array/intersection/each.1 with storage slimecore:_ util.intersection.var

execute if data storage slimecore:_ util.intersection.var.matches[0] run function slimecore:_/util/six/array/intersection/each_match

data remove storage slimecore:_ util.intersection.in.a[-1]
execute if data storage slimecore:_ util.intersection.in.a[0] run function slimecore:_/util/six/array/intersection/each