#> slimecore :_/util/ get_unsafe_calls
#--------------------
# -> unsafes: [{pack_id:PackId}]
#--------------------
# <- result: [PackReference]
#--------------------
# given than <unsafes> are unsafe, returns the unsafe calls. (all dependents, recursive)
#--------------------
# 1.
#--------------------

data modify storage slimecore:_/out get_unsafe_calls set value {result:[]}

data modify storage slimecore:_ u.get_unsafe_calls.seen_map set value {}

data modify storage slimecore:_ u.get_unsafe_calls.unsafes set from storage slimecore:_/in get_unsafe_calls.unsafes
execute if data storage slimecore:_ u.get_unsafe_calls.unsafes[0] run function slimecore:_/util/get_unsafe_calls/loop

data remove storage slimecore:_ u.get_unsafe_calls
data remove storage slimecore:_/in get_unsafe_calls

return 1