## IMPL > slimecore:eval/build
# entrypoint_order/entrypoint/conflict/possible_invs/each
#--------------------
# ../check
#--------------------

data modify storage slimecore:_ v.build.this_search set from storage slimecore:_ v.build.search_list[-1]

data modify storage slimecore:_ v.build.mline.2 set from storage slimecore:_ v.build.this_search.pack_ref
data modify storage slimecore:_ v.build.mline.4 set from storage slimecore:_ v.build.this_search.id
function slimecore:_/util/mline/9 with storage slimecore:_ v.build.mline

data remove storage slimecore:_ v.build.search_list[-1]
execute if data storage slimecore:_ v.build.search_list[0] run function slimecore:_/impl/eval/build/entrypoint_order/entrypoint/conflict/possible_invs/each