## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/conflict/gather_searchlist.1

data modify storage slimecore:_ v.build.list_entry.id set from storage slimecore:_ v.build.second_list[-1].key
data modify storage slimecore:_ v.build.search_list append from storage slimecore:_ v.build.list_entry

data remove storage slimecore:_ v.build.second_list[-1]
execute if data storage slimecore:_ v.build.second_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/gather_searchlist.1