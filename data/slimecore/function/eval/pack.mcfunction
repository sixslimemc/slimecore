#> slimecore : eval/pack

data remove storage slimecore:out pack

execute store result score *x _slimecore run function slimecore:_/impl/eval/pack/main

# DEBUG:
execute if data storage slimecore:out pack.result.error run tellraw @a ["PACK ERR: ", {'storage':'slimecore:out', 'nbt':'pack.result.error'}]

data remove storage slimecore:_ v.pack
data remove storage slimecore:in pack
scoreboard players reset *pack.error _slimecore
scoreboard players reset *pack.index _slimecore

return run scoreboard players get *x _slimecore