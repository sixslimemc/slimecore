#> slimecore : evaluate/partial/manifest/relative_order
#--------------------
# -> input: ManifestInputRelativeOrder
#--------------------
# <~ value? RelativeOrder
# <~ error? ValidationError
#--------------------
# TODO: description
#--------------------
# 1: success; >value< contains data.
# 0: error; >error< contains data.
#--------------------

data remove storage slimecore:out relative_order

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/partial/manifest/relative_order/main

data remove storage slimecore:_ v.relative_order
data remove storage slimecore:in relative_order

return run scoreboard players get *x _slimecore