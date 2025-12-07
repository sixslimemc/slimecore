#> slimecore:_/reload
# MINECRAFT : LOAD

# setup:
scoreboard objectives add _slimecore dummy

# DEBUG
scoreboard players reset *init _slimecore

# init:
execute unless score *init _slimecore matches 1 run function slimecore:_/init
scoreboard players set *init _slimecore 1

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players set *manifest_time _slimecore 0
