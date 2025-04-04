#> six:_/impl/object/partial/without_iter
#--------------------
# - six:_/impl/object/partial/only
#--------------------

data modify storage slimecore:_ util.partial.var.without.tag set from storage slimecore:_ util.partial.in.get.without[-1]
function slimecore:_/util/six/object/partial/without_iter.1 with storage slimecore:_ util.partial.var.without

data remove storage slimecore:_ util.partial.in.get.without[-1]
execute if data storage slimecore:_ util.partial.in.get.without[0] run function slimecore:_/util/six/object/partial/without_iter