# IMPL > slimecore : evaluate/relation/pack_supporting
# each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ v.pack_supporting.this_support set from storage slimecore:_ v.pack_supporting.supports[-1]

# check:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/relation/pack_supporting/supports/check

# add if supported:
execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_supporting.result append value {pack:""}
execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_supporting.result[-1].pack set from storage slimecore:_ v.pack_supporting.this_support.pack

data remove storage slimecore:_ v.pack_supporting.supports[-1]
execute if data storage slimecore:_ v.pack_supporting.supports[0] run function slimecore:_/impl/evaluate/relation/pack_supporting/supports/each
