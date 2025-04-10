
scoreboard objectives add _slimecore dummy

scoreboard players set *-1 _slimecore -1

# manifests:
data modify storage slimecore:_ manifests set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# auto rebuild if needed:
data modify storage slimecore:_ init.compare set from storage slimecore:_ cache.this_build.manifests
execute store success score *x _slimecore run data modify storage slimecore:_ init.compare set from storage slimecore:_ manifests
execute unless data storage slimecore:_ cache.this_build run scoreboard players set *x _slimecore 1
execute if score *x _slimecore matches 1.. run function slimecore:_/build/start

data remove storage slimecore:_ init