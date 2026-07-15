# UTIL > slimecore :_/util/ get_unsafe_calls
# loop
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ u.get_unsafe_calls.this_unsafe set from storage slimecore:_ u.get_unsafe_calls.unsafes[-1]

function slimecore:_/util/get_unsafe_calls/add with storage slimecore:_ u.get_unsafe_calls.this_unsafe

data remove storage slimecore:_ u.get_unsafe_calls.unsafes[-1]
execute if data storage slimecore:_ u.get_unsafe_calls.unsafes[0] run function slimecore:_/util/get_unsafe_calls/loop

