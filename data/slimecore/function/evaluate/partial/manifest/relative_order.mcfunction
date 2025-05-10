#> slimecore : evaluate/partial/manifest/relative_order
#--------------------
# -> input: ManifestInputRelativeOrder
#--------------------
# <~ value? RelativeOrder
#--------------------
# TODO: description
#--------------------
# 1: success; >value< contains data.
# 0: error, invalid <input>.
#--------------------

data remove storage slimecore:out relative_order

execute store success score *x _slimecore run function slimecore:_/impl/evaluate/partial/manifest/relative_order/main with storage slimecore:in relative_order

data remove storage slimecore:in relative_order

return run scoreboard players get *x _slimecore