#> six:_/impl/array/set/intersection/direct/each
#--------------------
# @api
#--------------------

data modify storage slimecore:_ util.intersection.var.a_item set from storage slimecore:_ util.intersection.in.a[-1]

execute if data storage slimecore:_ util.intersection.in.b[0] run function slimecore:_/util/six/array/intersection/direct/b_each

data remove storage slimecore:_ util.intersection.in.a[-1]
execute if data storage slimecore:_ util.intersection.in.a[0] run function slimecore:_/util/six/array/intersection/each