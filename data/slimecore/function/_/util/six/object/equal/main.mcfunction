#> six:api > object/equal
#--------------------
# -> a: obj
# -> b: obj
#--------------------
# ...
#--------------------
#> checks if <a> and <b> are exactly equal objects.
#--------------------
# ...
#--------------------
# 1 - <a> and <b> are equal
# 0 - <a> and <b> are not equal
#--------------------

execute store result score *equal.not _slimecore run data modify storage slimecore:_ util.equal.in.a set from storage slimecore:_ util.equal.in.b
scoreboard players set *equal.return _slimecore 0
execute if score *equal.not _slimecore matches 0 run scoreboard players set *equal.return _slimecore 1

scoreboard players reset *equal.not _slimecore
data remove storage slimecore:_ util.equal.var

return run scoreboard players get *equal.return _slimecore