#> slimecore:_/load/safe_mode/do
#--------------------
# ../main
#--------------------

tellraw @a {text:"SAFE MODE STARTED"}

# HOOK: meta_info/safe_mode/start
function #slimecore:hook/meta_info/safe_mode/start

data modify storage slimecore:_ t.safe_mode.unsafe_calls set from storage slimecore:data world.safe_mode.calls

# each load:
data modify storage slimecore:_ t.safe_mode.loads set from storage slimecore:data build.order.load
execute if data storage slimecore:_ t.safe_mode.loads[0] run function slimecore:_/load/safe_mode/loads/each

# HOOK: meta_info/safe_mode/end
function #slimecore:hook/meta_info/safe_mode/end

data remove storage slimecore:_ t.safe_mode