#> slimecore:_/build/first_pass/impls/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_impl set from storage slimecore:_ var.build.impls[-1]

function slimecore:_/build/first_pass/impls/check_seen with storage slimecore:_ var.build.this_impl

data remove storage slimecore:_ var.build.impls[-1]
execute if data storage slimecore:_ var.build.impls[0] run function slimecore:_/build/first_pass/impls/each