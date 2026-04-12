#> slimecore :_/util/kvpairs
#--------------------
# -> struc: {[string]: [any]}
#--------------------
# <- result: [{key: string, value: any, key_quote_type:("'" | '"')}]
#--------------------
# ripped from SixLib
#--------------------
# 1.
#--------------------

data remove storage slimecore:_/out kvpairs
data modify storage slimecore:_/out kvpairs.result set value []

execute summon text_display run function slimecore:_/util/kvpairs/do

scoreboard players reset *kvpairs.token_count _slimecore
scoreboard players reset *kvpairs.key_index _slimecore
data remove storage slimecore:_ u.kvpairs
data remove storage slimecore:_/in kvpairs

return 1