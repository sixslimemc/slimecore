## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/conflict/gather_searchlist
#--------------------
# ./check
#--------------------

# key = pack_ref, value = {<id...>: true}

data modify storage slimecore:_ v.build.list_entry set value {pack_ref:"", id:""}
data modify storage slimecore:_ v.build.list_entry.pack_ref set from storage slimecore:_ v.build.partial_list[-1].key
data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.partial_list[-1].value
function slimecore:_/util/kvpairs/main

data modify storage slimecore:_ v.build.second_list set from storage slimecore:_/out kvpairs.result
execute if data storage slimecore:_ v.build.second_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/gather_searchlist.1

data remove storage slimecore:_ v.build.partial_list[-1]
execute if data storage slimecore:_ v.build.partial_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/gather_searchlist