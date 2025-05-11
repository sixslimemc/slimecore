#> slimecore:_/build/pass_1/requirements/loads/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.reqloads[-1]
data modify storage slimecore:_ var.build.req_pack set from storage slimecore:_ var.build.requirements.out[-1].pack
function slimecore:_/build/pass_1/requirements/loads/set_order with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.reqloads[-1]
execute if data storage slimecore:_ var.build.reqloads[0] run function slimecore:_/build/pass_1/requirements/loads/each