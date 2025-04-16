
# init declarations:
scoreboard objectives add _slimecore dummy

# DEBUG:
scoreboard players reset *installed _slimecore
tellraw @a ":"
tellraw @a "------------------"
tellraw @a "===== RELOAD ====="
tellraw @a "------------------"
tellraw @a ":"
data modify storage test: out.manifest_throws set value []

# consts:
execute unless score *installed _slimecore matches 1 run function slimecore:_/def_consts/main

# manifests:
data modify storage slimecore:_ manifests set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# auto rebuild if needed:
data modify storage slimecore:_ var.init.compare set from storage slimecore:_ cache.this_build.manifests
execute store success score *x _slimecore run data modify storage slimecore:_ var.init.compare set from storage slimecore:_ manifests
execute unless data storage slimecore:_ cache.this_build run scoreboard players set *x _slimecore 1
execute if score *x _slimecore matches 1.. run data modify storage slimecore:_ build.in.manifests set from storage slimecore:_ manifests
scoreboard players reset *y _slimecore
execute if score *x _slimecore matches 1.. store result score *y _slimecore run function slimecore:_/build/main

# end
data remove storage slimecore:_ var.init
scoreboard players set *installed _slimecore 1