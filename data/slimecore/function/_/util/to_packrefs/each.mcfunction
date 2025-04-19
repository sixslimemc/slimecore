#> slimecore:_/util/to_packrefs/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ util.to_packrefs.out.result append value {}
data modify storage slimecore:_ util.to_packrefs.out.result[-1].pack set from storage slimecore:_ util.to_packrefs.in.packs[-1]

data remove storage slimecore:_ util.to_packrefs.in.packs[-1]
execute if data storage slimecore:_ util.to_packrefs.in.packs[0] run function slimecore:_/util/to_packrefs/each
