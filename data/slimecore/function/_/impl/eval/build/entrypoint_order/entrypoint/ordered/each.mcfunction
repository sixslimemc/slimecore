## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/ordered/each
#--------------------
# ../each
#--------------------
# iterates in forward existing order.

data modify storage slimecore:_ v.build.this_ordered set from storage slimecore:_ v.build.order[0]

data modify storage slimecore:_ x.mline set value {1:"return run execute if data storage slimecore:_ v.build.entrypoint_order.in.befores.'", 2:true, 3:"'.'", 4:true, 5:"'.'", 6:true, 7:"'{'", 8:true, 9:"':true}"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.this_entrypoint.pack_ref
data modify storage slimecore:_ x.mline.4 set from storage slimecore:_ v.build.this_entrypoint.id
data modify storage slimecore:_ x.mline.6 set from storage slimecore:_ v.build.this_ordered.pack_ref
data modify storage slimecore:_ x.mline.8 set from storage slimecore:_ v.build.this_ordered.id
execute store result score *x _slimecore run function slimecore:_/util/mline/9 with storage slimecore:_ x.mline
execute if score *x _slimecore matches 1 run return 0

scoreboard players add *build.insert_index _slimecore 1

data remove storage slimecore:_ v.build.order[0]
execute if data storage slimecore:_ v.build.order[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/ordered/each