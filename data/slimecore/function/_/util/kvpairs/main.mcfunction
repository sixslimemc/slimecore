#> slimecore :_/util/ kvpairs
#--------------------
# -> map: {[string]: [any]}
#--------------------
# <- result: [{key: string, value: any}]
#--------------------
# assumes simple keys (can be indexed without quotes)
#--------------------
# 1.
#--------------------

data remove storage slimecore:_/out kvpairs
data modify storage slimecore:_/out kvpairs.result set value []

# {..string}
execute summon text_display run function slimecore:_/util/kvpairs/do

scoreboard players reset *kvpairs.length
scoreboard players reset *kvpairs.end
scoreboard players reset *kvpairs.start
data remove storage slimecore:_ u.kvpairs
data remove storage slimecore:_/in kvpairs

return 1