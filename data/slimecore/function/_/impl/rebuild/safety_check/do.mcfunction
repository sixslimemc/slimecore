# IMPL > slimecore:rebuild
# safety_check/do
#--------------------
# ../main
#--------------------

# get manifests:
function slimecore:_/get_manifests

data modify storage slimecore:_ v.rebuild.pack_seen_map set value {}

# pack checks:
# - check duplicate installed ids
data modify storage slimecore:_ v.rebuild.pack_checks set from storage slimecore:_ data.manifest_packs
data modify storage slimecore:_ v.rebuild.pack_checks append from storage slimecore:data world.installed[{disabled:true}].pack
execute if data storage slimecore:_ v.rebuild.pack_checks[0] run function slimecore:_/impl/rebuild/safety_check/packs/each

# is unsafe:
execute if score *rebuild.unsafe _slimecore matches 1 run return run function slimecore:_/impl/rebuild/safety_check/is_unsafe/do

# ~ SUCCESS REACHED

scoreboard players reset *safe_mode _slimecore
data modify storage slimecore:data world.safe_mode set value {calls:[], enabled:false}
return 1