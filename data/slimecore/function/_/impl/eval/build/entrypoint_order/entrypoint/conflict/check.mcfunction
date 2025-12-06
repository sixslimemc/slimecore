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

data modify storage slimecore:_ v.build.search_list set value []
$data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.entrypoint_order.in.befores.'$(pack_ref)'.'$(id)'
function slimecore:_/util/kvpairs/main
data modify storage slimecore:_ v.build.partial_list set from storage slimecore:_/out kvpairs.result
execute if data storage slimecore:_ v.build.partial_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/gather_searchlist
