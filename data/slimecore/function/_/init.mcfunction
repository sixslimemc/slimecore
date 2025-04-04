
scoreboard objectives add _slimecore dummy

scoreboard players set *-1 _slimecore -1

data modify storage slimecore:data constants.BEFORE set value 1b
data modify storage slimecore:data constants.AFTER set value -1b

# MANIFESTS:
data modify storage slimecore:_ init.manifests set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

data modify storage slimecore:_ init.compare set from storage slimecore:_ this_build.manifests
execute store success score *init.should_rebuild _slimecore run data modify storage slimecore:_ init.compare set from storage slimecore:_ init.manifests
execute unless data storage slimecore:_ this_build run scoreboard players set *init.should_rebuild _slimecore 1

execute if score *init.should_rebuild _slimecore matches 1.. run function slimecore:_/build/start

scoreboard players reset *init.should_rebuild _slimecore
data remove storage slimecore:_ init