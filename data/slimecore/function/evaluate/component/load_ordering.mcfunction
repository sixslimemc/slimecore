#> slimecore : evaluate/component/load_ordering
#--------------------
# ~> input: InputLoadOrdering
#--------------------
# <~ value: LoadWords<RelativeOrder>
# <~ error:
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data remove storage slimecore:out load_ordering

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/load_ordering/main

data remove storage slimecore:_ v.load_ordering
data remove storage slimecore:in load_ordering

return run scoreboard players get *x _slimecore