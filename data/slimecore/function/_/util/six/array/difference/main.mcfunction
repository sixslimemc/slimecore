#> slimecore:util > six/array/difference
#--------------------
# -> a: obj[]
# -> b: obj[]
# => compare: {only: string[]} | {without: string[]} | {} = {}
#--------------------
# <- unique_a: obj[]
# <- unique_b: obj[]
#--------------------
#> gets all objects from <a> and <b> that do not share the same values for tags specified in <compare>.
#--------------------
#- if <compare> is not specified, will compare objects directly (allows for non-object comparisons)
#--------------------
# ...
#--------------------

execute store success score *difference.direct _slimecore unless data storage slimecore:_ util.difference.in.compare.only unless data storage slimecore:_ util.difference.in.compare.without

execute unless score *difference.direct _slimecore matches 1 run data modify storage slimecore:_ util.difference.out.unique_a set from storage slimecore:_ util.difference.in.a
execute unless score *difference.direct _slimecore matches 1 run data modify storage slimecore:_ util.difference.out.unique_b set from storage slimecore:_ util.difference.in.b
execute unless score *difference.direct _slimecore matches 1 if data storage slimecore:_ util.difference.in.a[0] run function slimecore:_/util/six/array/difference/each

execute if score *difference.direct _slimecore matches 1 run function slimecore:_/util/six/array/difference/direct/do

data remove storage slimecore:_ util.difference.in
data remove storage slimecore:_ util.difference.var
scoreboard players reset *difference.direct _slimecore
scoreboard players reset *difference.found_equal _slimecore