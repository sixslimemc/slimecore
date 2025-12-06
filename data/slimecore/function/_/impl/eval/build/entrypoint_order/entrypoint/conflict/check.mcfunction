## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/conflict/check
#--------------------
# ../each
#--------------------

# if entrypoint is before itself, there is a conflict.
$execute unless data storage slimecore:_ v.build.entrypoint_order.in.befores.'$(pack_ref)'.'$(id)'.'$(pack_ref)'{'$(id)':true} run return 0

scoreboard players set *build.error _slimecore 1

# return if error involving this entrypoint already created:
$execute if data storage slimecore:_ v.build.error_involved[{pack_ref:'$(pack_ref)', id:'$(id)'}] run return 0

$execute unless data storage slimecore:out build.result.error.'$(error_key)' run data modify storage slimecore:out build.result.error.'$(error_key)' set value []

data modify storage slimecore:_ v.build.conflict_group set value []

# list of {pack_ref: PackId, id: EntrypointId} that could possibly be involved in this conflict group
# (i.e. everything that this entrypoint is marked before)
data modify storage slimecore:_ v.build.search_list set value []

# populate {..search_list}
$data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.entrypoint_order.in.befores.'$(pack_ref)'.'$(id)'
function slimecore:_/util/kvpairs/main
data modify storage slimecore:_ v.build.partial_list set from storage slimecore:_/out kvpairs.result
execute if data storage slimecore:_ v.build.partial_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/gather_searchlist

# find entrypoints that are actually involved in conflict:
data modify storage slimecore:_ v.build.mline set value {1:"execute if data storage slimecore:_ v.build.entrypoint_order.in.befores.'", 2:true, 3:"'.'", 4:true, 5:"'.'", 6:true, 7:"'{'", 8:true, 9:"':true} run data modify storage slimecore:_ v.build.conflict_group append from storage slimecore:_ v.build.this_search"}
data modify storage slimecore:_ v.build.mline.6 set from storage slimecore:_ v.build.this_entrypoint.pack_ref
data modify storage slimecore:_ v.build.mline.8 set from storage slimecore:_ v.build.this_entrypoint.id
execute if data storage slimecore:_ v.build.search_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/possible_invs/each

# add error entry:
data modify storage slimecore:_ v.build.error_involved append from storage slimecore:_ v.build.conflict_group[]
data modify storage slimecore:_ x.entry set value {}
data modify storage slimecore:_ x.entry.conflicting_group set from storage slimecore:_ v.build.conflict_group
$data modify storage slimecore:out build.result.error.'$(error_key)' append from storage slimecore:_ x.entry
