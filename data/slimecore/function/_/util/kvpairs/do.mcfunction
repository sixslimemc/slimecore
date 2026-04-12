# UTIL > slimecore : kvpairs
# do
#--------------------
# ./main
#--------------------

kill @s

data modify storage slimecore:_/out kvpairs.result set value []

data modify entity @s text set value {plain:true, storage:"slimecore:_/in", nbt:"kvpairs.struc"}
data modify storage slimecore:_ u.kvpairs.buffer set from entity @s text.extra

execute store result score *kvpairs.token_count _slimecore if data storage slimecore:_ u.kvpairs.buffer[]
scoreboard players set *kvpairs.key_index _slimecore 2

execute store result storage slimecore:_ u.kvpairs.key_index int 1 run scoreboard players get *kvpairs.key_index _slimecore
execute if score *kvpairs.key_index _slimecore < *kvpairs.token_count _slimecore run function slimecore:_/util/kvpairs/next_key with storage slimecore:_ u.kvpairs

return 1