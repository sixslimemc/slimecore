#> slimecore:_/load/main
#--------------------
# _/reload
#--------------------


# HOOK: info/load/start
function #slimecore:hook/info/load/start

# DEBUG
tellraw @a {text:"> preload entrypoints", color:"dark_aqua"}
# preload entrypoints:
data modify storage slimecore:_ v.load.tag_key set value "preload_entrypoint"
data modify storage slimecore:_ v.load.entrypoints set from storage slimecore:data build.order.preload_entrypoints
execute if data storage slimecore:_ v.load.entrypoints[0] run function slimecore:_/load/entrypoints/each

# DEBUG
tellraw @a {text:"> loads", color:"dark_aqua"}
# entrypoints:
data modify storage slimecore:_ v.load.loads set from storage slimecore:data build.order.load
execute if data storage slimecore:_ v.load.loads[0] run function slimecore:_/load/loads/each


# DEBUG
tellraw @a {text:"> entrypoints", color:"dark_aqua"}
# entrypoints:
data modify storage slimecore:_ v.load.tag_key set value "entrypoint"
data modify storage slimecore:_ v.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute if data storage slimecore:_ v.load.entrypoints[0] run function slimecore:_/load/entrypoints/each

# set rebuild check packs:
function slimecore:_/get_manifests
data modify storage slimecore:_ data.rebuild_check.manifests set from storage slimecore:_ data.manifest_packs

# HOOK: info/load/end
function #slimecore:hook/info/load/end

data remove storage slimecore:_ v.load