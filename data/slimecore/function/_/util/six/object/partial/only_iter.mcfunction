#> six:_/impl/object/partial/only_iter
#--------------------
# - six:_/impl/object/partial/only
#--------------------

data modify storage slimecore:_ util.partial.var.only.tag set from storage slimecore:_ util.partial.in.get.only[-1]
function slimecore:_/util/six/object/partial/only_iter.1 with storage slimecore:_ util.partial.var.only

data remove storage slimecore:_ util.partial.in.get.only[-1]
execute if data storage slimecore:_ util.partial.in.get.only[0] run function slimecore:_/util/six/object/partial/only_iter