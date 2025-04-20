#> slimecore:util > to_packrefs
#--------------------
# -> packs[]: PackID
#--------------------
# <- result[]: PackReference
#--------------------
# converts a []PackID to []PackReference.
#--------------------

data merge storage slimecore:_ {util:{to_packrefs:{out:{result:[]}}}}

execute if data storage slimecore:_ util.to_packrefs.in.packs[0] run function slimecore:_/util/to_packrefs/each

data remove storage slimecore:_ util.to_packrefs.in