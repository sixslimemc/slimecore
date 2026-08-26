#> slimecore :_/util/ keystring
#--------------------
# -> parts: [{key: string, index?: int}]
#--------------------
# <- result: StructKeyString
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage slimecore:_/out keystring set value {result:""}

data modify storage slimecore:_ u.keystring.result set value ""
execute if data storage slimecore:_/in keystring.parts[0] run function slimecore:_/util/keystring/parts/each

# remove leading '.':
data modify storage slimecore:_/out keystring.result set string storage slimecore:_ u.keystring.result 1

data remove storage slimecore:_ u.keystring
data remove storage slimecore:_/in keystring

return 1