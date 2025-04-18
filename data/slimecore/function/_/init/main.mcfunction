
# init declarations:
scoreboard objectives add _slimecore dummy

# DEBUG:
scoreboard players reset *installed _slimecore
tellraw @a ":"
tellraw @a "------------------"
tellraw @a "===== RELOAD ====="
tellraw @a "------------------"
tellraw @a ":"

# consts:
execute unless score *installed _slimecore matches 1 run function slimecore:_/def_consts/main

# manifests:
data modify storage slimecore:_ manifests set value {valid:[], invalid:[]}
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# rebuild if needed:
data modify storage slimecore:_ var.init.compare set from storage slimecore:_ cache.this_build.manifests
execute store success score *init.do_rebuild _slimecore run data modify storage slimecore:_ var.init.compare set from storage slimecore:_ manifests.valid
execute unless data storage slimecore:_ cache.this_build run scoreboard players set *init.do_rebuild _slimecore 1
execute if data storage slimecore:config debug.build{disable_rebuild:true} run scoreboard players set *init.do_rebuild _slimecore 0
execute if score *init.do_rebuild _slimecore matches 1.. run function slimecore:_/init/rebuild

# end
data remove storage slimecore:_ var.init
scoreboard players reset *init.do_rebuild _slimecore
scoreboard players reset *init.build_success _slimecore

scoreboard players set *installed _slimecore 1
