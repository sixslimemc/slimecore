# IMPL > slimecore:eval/build
# pass_load/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.loads[-1]

scoreboard players operation *build.insert_index _slimecore = *build.order_count _slimecore

data modify storage slimecore:_ v.build.order set from storage slimecore:_ v.build.final_order.load
execute if data storage slimecore:_ v.build.order[0] run function slimecore:_/impl/eval/build/pass_load/ordered/each

scoreboard players add *build.order_count _slimecore 1
data remove storage slimecore:_ v.build.loads[-1]
execute if data storage slimecore:_ v.build.loads[0] run function slimecore:_/impl/eval/build/pass_load/each