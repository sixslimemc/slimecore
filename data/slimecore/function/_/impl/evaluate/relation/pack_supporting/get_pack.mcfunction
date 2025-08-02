# IMPL > slimecore : evaluate/relation/pack_supporting
# get_pack
#--------------------
# ./main
#--------------------

data remove storage slimecore:_ v.pack_supporting.get_result
$data modify storage slimecore:_ v.pack_supporting.get_result set from storage slimecore:in pack_supporting.build.auxilary.pack_map."$(pack)"

