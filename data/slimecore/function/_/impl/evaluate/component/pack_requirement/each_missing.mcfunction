# IMPL > slimecore : evaluate/component/pack_requirement
# each_missing
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ v.pack_requirement.mline.2 set from storage slimecore:_ v.pack_requirement.missings[-1].key

function slimecore:_/util/mline/3 with storage slimecore:_ v.pack_requirement.mline

data remove storage slimecore:_ v.pack_requirement.missings[-1]
execute if data storage slimecore:_ v.pack_requirement.missings[0] run function slimecore:_/impl/evaluate/component/pack_requirement/each_missing