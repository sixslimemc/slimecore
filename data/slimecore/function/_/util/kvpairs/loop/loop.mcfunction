# UTIL > kvpairs
# loop/loop
#--------------------
# ../do
#--------------------

execute store result storage slimecore:_ x.start int 1 run scoreboard players get *kvpairs.start _slimecore
execute store result storage slimecore:_ x.end int 1 run scoreboard players get *kvpairs.end _slimecore
scoreboard players operation *x _slimecore = *kvpairs.end _slimecore
execute store result storage slimecore:_ x.i int 1 run scoreboard players add *x _slimecore 1
function slimecore:_/util/kvpairs/loop/loop.1 with storage slimecore:_ x

execute if score *kvpairs.end _slimecore < *kvpairs.length _slimecore run function slimecore:_/util/kvpairs/loop/loop