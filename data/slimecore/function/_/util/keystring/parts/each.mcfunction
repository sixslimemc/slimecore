# UTIL > slimecore :_/util/ keystring
# parts/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ u.keystring.key set from storage slimecore:_/in keystring.parts[0].key
function slimecore:_/util/keystring/parts/key with storage slimecore:_ u.keystring

data modify storage slimecore:_ u.keystring.index set from storage slimecore:_/in keystring.parts[0].index
execute if data storage slimecore:_ u.keystring.index run function slimecore:_/util/keystring/parts/index with storage slimecore:_ u.keystring

data remove storage slimecore:_/in keystring.parts[0]
execute if data storage slimecore:_/in keystring.parts[0] run function slimecore:_/util/keystring/parts/each