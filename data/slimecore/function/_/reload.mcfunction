#> slimecore:_/reload
# MINECRAFT : LOAD

# if building, ignore reload and continue building:
execute if score *building _slimecore matches 1.. run return run function slimecore:_/rebuild/continue

# setup:
scoreboard objectives add _slimecore dummy

# DEBUG
scoreboard players reset *init _slimecore

# init:
execute unless score *init _slimecore matches 1 run function slimecore:_/init
scoreboard players set *init _slimecore 1

# if manual rebuild is forced, load and return:
execute if data storage slimecore:config {force_manual_rebuild:true} run return run function slimecore:_/load/main

# rebuild:
function slimecore:_/rebuild/main