# IMPL > slimecore : evaluate/relation/pack_supporting
# supports/each
#--------------------
# ../main
#--------------------

# get support from build:
data modify storage slimecore:_ x.pack set from storage slimecore:_ v.pack_supporting.this_support.pack
function slimecore:_/impl/evaluate/relation/pack_supporting/get_pack with storage slimecore:_ x

# check if exists:
execute unless data storage slimecore:_ v.pack_supporting.get_result run return 0
data modify storage slimecore:_ v.pack_supporting.support_manifest set from storage slimecore:_ v.pack_supporting.get_result

# check version:
data modify storage slimecore:in version_requirement_fulfilled.requirement set from storage slimecore:_ v.pack_supporting.this_support.version
data modify storage slimecore:in version_requirement_fulfilled.version set from storage slimecore:_ v.pack_supporting.support_manifest.version
execute store result score *x _slimecore run function slimecore:evaluate/relation/version_requirement_fulfilled
execute if score *x _slimecore matches ..0 run return 0

return 1