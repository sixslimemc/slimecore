#> slimecore:_/load/main
#--------------------
# _/reload
#--------------------

# check safe mode:
execute if score *safe_mode _slimecore matches 1.. run return run function slimecore:_/load/safe_mode/do

# HOOK: load/start
function #slimecore:hook/load/start

# HOOK: load/preload_entrypoints
function #slimecore:hook/load/preload_entrypoints

# preload entrypoints:
data modify storage slimecore:_ t.load.tag_key set value "preload_entrypoint"
data modify storage slimecore:_ t.load.entrypoints set from storage slimecore:data build.order.preload_entrypoints
execute if data storage slimecore:_ t.load.entrypoints[0] run function slimecore:_/load/entrypoints/each

# HOOK: load/loads
function #slimecore:hook/load/loads

# entrypoints:
data modify storage slimecore:_ t.load.loads set from storage slimecore:data build.order.load
execute if data storage slimecore:_ t.load.loads[0] run function slimecore:_/load/loads/each

# HOOK: load/entrypoints
function #slimecore:hook/load/entrypoints

# entrypoints:
data modify storage slimecore:_ t.load.tag_key set value "entrypoint"
data modify storage slimecore:_ t.load.entrypoints set from storage slimecore:data build.order.entrypoints
execute if data storage slimecore:_ t.load.entrypoints[0] run function slimecore:_/load/entrypoints/each

# set rebuild check packs:
function slimecore:_/get_manifests
data modify storage slimecore:_ data.rebuild_check.manifests set from storage slimecore:_ data.manifest_packs

# HOOK: load/end
function #slimecore:hook/load/end

data remove storage slimecore:_ t.load