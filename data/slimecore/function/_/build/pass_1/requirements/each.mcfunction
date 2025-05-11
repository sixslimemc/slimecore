#> slimecore:_/build/pass_1/requirements/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.requirements.out append from storage slimecore:_ var.build.requirements.in[-1]

data modify storage slimecore:_ var.build.reqloads set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ var.build.reqloads[0] run function slimecore:_/build/pass_1/requirements/loads/each

data remove storage slimecore:_ var.build.requirements.in[-1]
execute if data storage slimecore:_ var.build.requirements.in[0] run function slimecore:_/build/pass_1/requirements/each