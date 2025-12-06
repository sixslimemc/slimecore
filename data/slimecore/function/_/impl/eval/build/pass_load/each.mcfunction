# IMPL > slimecore:eval/build
# pass_load/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.loads[-1]

scoreboard players operation *build.insert_index _slimecore = *build.order_count _slimecore

data modify storage slimecore:_ v.build.order set from storage slimecore:_ v.build.final_order.loads
execute if data storage slimecore:_ v.build.order[0] run function slimecore:_/impl/eval/build/pass_load/ordered/each

data modify storage slimecore:_ x.entry set value {pack_ref:""}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.final_order.loads insert ", 2:true, 3:" from storage slimecore:_ x.entry"}
execute store result storage slimecore:_ x.mline.2 int 1 run scoreboard players get *build.insert_index _slimecore
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

scoreboard players add *build.order_count _slimecore 1
data remove storage slimecore:_ v.build.loads[-1]
execute if data storage slimecore:_ v.build.loads[0] run function slimecore:_/impl/eval/build/pass_load/each