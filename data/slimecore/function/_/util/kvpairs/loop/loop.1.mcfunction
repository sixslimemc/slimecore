# UTIL > kvpairs
# loop/loop.1

$data modify storage slimecore:_ u.kvpairs.char set string storage slimecore:_ u.kvpairs.string $(end) $(i)

# DEBUG:
tellraw @a ["CHAR: ", {'storage':'slimecore:_', 'nbt':'u.kvpairs.char'}]
# return if not ':'
execute unless data storage slimecore:_ u.kvpairs{char:":"} run return run scoreboard players add *kvpairs.end _slimecore 1

# ~ start..end must be the key

# get {..entry.key} and {..entry.value}
$data modify storage slimecore:_ u.kvpairs.entry.key set string storage slimecore:_ u.kvpairs.string $(start) $(end)
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ u.kvpairs.entry.value set from storage slimecore:_/in kvpairs.map.", 2:true}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ u.kvpairs.entry.key
function slimecore:_/util/mline/2 with storage slimecore:_ x.mline

data modify storage slimecore:_/out kvpairs.result append from storage slimecore:_ u.kvpairs.entry

# move 'end' forward the length of the value:
data modify entity @s text set value {storage:"slimecore:_", nbt:"u.kvpairs.entry.value"}
# DEBUG:
tellraw @a ["TEXT VALUE: ", {'entity':'@s', 'nbt':'text'}]
execute store result score *x _slimecore run data get entity @s text
scoreboard players operation *kvpairs.end _slimecore += *x _slimecore

# move forward for the ':' and ',' characters
scoreboard players add *kvpairs.end _slimecore 2

scoreboard players operation *kvpairs.start _slimecore = *kvpairs.end _slimecore