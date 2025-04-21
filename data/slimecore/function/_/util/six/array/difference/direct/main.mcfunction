#> slimecore:_/impl/util/six/array/difference/direct/main
#--------------------
# @api
#--------------------

# populate {.out.unique_a}
data merge storage slimecore:_ {util:{difference:{var:{direct_unique:[]}}}}
data modify storage slimecore:_ util.difference.var.a_iter set from storage slimecore:_ util.difference.in.a
data modify storage slimecore:_ util.difference.var.b_iter set from storage slimecore:_ util.difference.in.b
execute if data storage slimecore:_ util.difference.var.a_iter[0] run function slimecore:_/util/six/array/difference/direct/each
data modify storage slimecore:_ util.difference.out.unique_a set from storage slimecore:_ util.difference.var.direct_unique

# populate {.out.unique_b}
data merge storage slimecore:_ {util:{difference:{var:{direct_unique:[]}}}}
data modify storage slimecore:_ util.difference.var.a_iter set from storage slimecore:_ util.difference.in.b
data modify storage slimecore:_ util.difference.var.b_iter set from storage slimecore:_ util.difference.in.a
execute if data storage slimecore:_ util.difference.var.a_iter[0] run function slimecore:_/util/six/array/difference/direct/each
data modify storage slimecore:_ util.difference.out.unique_b set from storage slimecore:_ util.difference.var.direct_unique