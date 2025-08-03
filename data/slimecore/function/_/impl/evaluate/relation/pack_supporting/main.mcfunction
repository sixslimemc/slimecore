# IMPL > slimecore : evaluate/relation/pack_supporting
# main
#--------------------

function slimecore:_/impl/evaluate/relation/pack_supporting/get_pack with storage slimecore:in pack_supporting.for
execute unless data storage slimecore:_ v.pack_supporting.get_result run return 0

data merge storage slimecore:out {pack_supporting:{result:[]}}

data modify storage slimecore:_ v.pack_supporting.supports set from storage slimecore:_ v.pack_supporting.get_result.supports

execute if data storage slimecore:_ v.pack_supporting.supports[0] run function slimecore:_/impl/evaluate/relation/pack_supporting/supports/each

return 1