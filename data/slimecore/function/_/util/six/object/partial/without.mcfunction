#> six:_/impl/object/partial/without
#--------------------
# - six:api/object/partial
#--------------------

data modify storage slimecore:_ util.partial.out.result set from storage slimecore:_ util.partial.in.object

execute if data storage slimecore:_ util.partial.get.without[0] run function slimecore:_/util/six/object/partial/without_iter
