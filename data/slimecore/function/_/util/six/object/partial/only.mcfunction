#> six:_/impl/object/partial/only
#--------------------
# - six:api/object/partial
#--------------------

data modify storage slimecore:_ util.partial.out.result set value {}

execute if data storage slimecore:_ util.partial.in.get.only[0] run function slimecore:_/util/six/object/partial/only_iter
