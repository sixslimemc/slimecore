# IMPL > slimecore : evaluate/relation/pack_supporting
# main
#--------------------

function slimecore:_/impl/evaluate/relation/pack_supporting/get_pack with storage slimecore:in pack_supporting.for
execute unless data storage slimecore:_ v.pack_supporting.get_result run return 0

data merge storage slimecore:out {pack_supporting:{result:[]}}

data modify storage slimecore:_ v.pack_supporting.parent set from storage slimecore:_ v.pack_supporting.get_result

return 1