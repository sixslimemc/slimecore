#> slimecore:_/build/first_pass/each
#--------------------
# ../start
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# check duplicate manifests:
execute store success score *x _slimecore run function slimecore:_/build/first_pass/check_dupe with storage slimecore:_ var.build.this_man
execute unless score *x _slimecore matches 1 run function slimecore:_/build/first_pass/update_map with storage slimecore:_ var.build.this_man

# check multiple impls:
data modify storage slimecore:_ var.build.impls set from storage slimecore:_ var.build.this_man.implements
execute if data storage slimecore:_ var.build.impls[0] run function slimecore:_/build/first_pass/impls/each

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/first_pass/each