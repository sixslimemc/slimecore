#> slimecore : evaluate/component/relative_order
#--------------------
# ~> input? InputRelativeOrder
#--------------------
# <~ value? RelativeOrder
# <~ error? ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: valid <input>; >value< contains data.
# 0: invalid <input>; >error< contains data.
#--------------------

data remove storage slimecore:out relative_order

execute store success score *x _slimecore run function slimecore:_/impl/evaluate/component/relative_order/main

data remove storage slimecore:in relative_order

return run scoreboard players get *x _slimecore