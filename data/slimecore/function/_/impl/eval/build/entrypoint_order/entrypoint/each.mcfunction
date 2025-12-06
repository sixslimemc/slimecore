## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/each
#--------------------
# ../do
#--------------------
# iterates in backward initial order.

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoint_order.in.initial[-1]

# find correct *.insert_index:
scoreboard players set *build.insert_index _slimecore 0
data modify storage slimecore:_ v.build.order set from storage slimecore:_ v.build.entrypoint_order.out
execute if data storage slimecore:_ v.build.order[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/ordered/each

# insert into out order:
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.entrypoint_order.out insert ", 2:true, 3:" from storage slimecore:_ v.build.this_entrypoint"}
execute store result storage slimecore:_ x.mline.2 int 1 run scoreboard players get *build.insert_index _slimecore
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

# check/handle conflicts:
data modify storage slimecore:_ x.macro set from storage slimecore:_ v.build.this_entrypoint
data modify storage slimecore:_ x.macro.error_key set from storage slimecore:_ v.build.entrypoint_order.in.error_key
function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/check with storage slimecore:_ x.macro

data remove storage slimecore:_ v.build.entrypoint_order.in.initial[-1]
execute if data storage slimecore:_ v.build.entrypoint_order.in.initial[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/each