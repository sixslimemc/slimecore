# UTIL > slimecore : kvpairs
# next_key
#--------------------
# ./main
#--------------------

data remove storage slimecore:_ u.kvpairs.key_token
$execute store success score *x _slimecore run data modify storage slimecore:_ u.kvpairs.key_token set from storage slimecore:_ u.kvpairs.buffer[$(key_index)]
execute if score *x _slimecore matches 0 run return 0

data modify storage slimecore:_ u.kvpairs.result_entry set value {key:"", key_quote_type:"'", value:true}

# check if quoted key:
execute store success score *x _slimecore if data storage slimecore:_ u.kvpairs.key_token.extra
execute if score *x _slimecore matches 0 run data modify storage slimecore:_ u.kvpairs.result_entry.key set from storage slimecore:_ u.kvpairs.key_token
execute if score *x _slimecore matches 1 run data modify storage slimecore:_ u.kvpairs.result_entry.key set from storage slimecore:_ u.kvpairs.key_token.extra[0]
execute if score *x _slimecore matches 1 run data modify storage slimecore:_ u.kvpairs.result_entry.key_quote_type set from storage slimecore:_ u.kvpairs.text

# set {..result_entry.value}
function slimecore:_/util/kvpairs/get_value with storage slimecore:_ u.kvpairs.result_entry

data modify storage slimecore:_/out kvpairs.result append from storage slimecore:_ u.kvpairs.result_entry

# count and skip tokens that are part of the key's value:
data modify entity @s text set value {plain:true, storage:"slimecore:_", nbt:"u.kvpairs.result_entry.value"}
execute store result score *x _slimecore if data entity @s text.extra[]
scoreboard players operation *kvpairs.key_index _slimecore += *x _slimecore

# go to next key, always 6 tokens away (':', ' ', ',', ' ', '' and current key):
scoreboard players add *kvpairs.key_index _slimecore 6
execute unless score *kvpairs.key_index _slimecore < *kvpairs.token_count _slimecore run return 0

execute store result storage slimecore:_ u.kvpairs.key_index int 1 run scoreboard players get *kvpairs.key_index _slimecore
function slimecore:_/util/kvpairs/next_key with storage slimecore:_ u.kvpairs