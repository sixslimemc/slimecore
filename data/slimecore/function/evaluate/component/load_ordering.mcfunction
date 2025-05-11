#> slimecore : evaluate/component/load_ordering
#--------------------
# -> input: InputLoadOrdering | any
#--------------------
# <~ value: LoadOrdering
# <~ error: CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <input> is a valid InputLoadOrdering; >value< contains data.
# 0: <input> is not a valid InputLoadOrdering; >error< contains data.
#--------------------

data remove storage slimecore:out load_ordering

# DEBUG:
tellraw @a ["in: ", {'storage':'slimecore:in', 'nbt':'load_ordering.input'}]
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/load_ordering/main

# DEBUG:
tellraw @a ["out: ", {'storage':'slimecore:out', 'nbt':'load_ordering'}]

data remove storage slimecore:_ v.load_ordering
data remove storage slimecore:in load_ordering

return run scoreboard players get *x _slimecore