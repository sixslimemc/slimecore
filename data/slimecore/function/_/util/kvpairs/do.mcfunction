# UTIL > kvpairs
# do
#--------------------
# ./main AS [text_display]
#--------------------
kill @s

data modify entity @s text set value {storage:"slimecore:_/in", nbt:"kvpairs.map"}
data modify storage slimecore:_ u.kvpairs.string set from entity @s text

scoreboard players set *kvpairs.start _slimecore 1
scoreboard players set *kvpairs.end _slimecore 1
execute store result score *kvpairs.length _slimecore run data get storage slimecore:_ u.kvpairs.string

execute if score *kvpairs.end _slimecore < *kvpairs.length _slimecore run function slimecore:_/util/kvpairs/loop/loop