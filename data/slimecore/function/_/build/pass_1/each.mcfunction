#> slimecore:_/build/pass_1/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# apply expected order to dependencies:
data remove storage slimecore:_ var.build.requirements
data modify storage slimecore:_ var.build.requirements.in set from storage slimecore:_ var.build.this_man.dependencies
execute if data storage slimecore:_ var.build.requirements.in[0] run function slimecore:_/build/pass_1/requirements/each
data modify storage slimecore:_ var.build.this_man.dependencies set from storage slimecore:_ var.build.requirements.out

# apply expected order to supports:
data remove storage slimecore:_ var.build.requirements
data modify storage slimecore:_ var.build.requirements.in set from storage slimecore:_ var.build.this_man.supports
execute if data storage slimecore:_ var.build.requirements.in[0] run function slimecore:_/build/pass_1/requirements/each
data modify storage slimecore:_ var.build.this_man.supports set from storage slimecore:_ var.build.requirements.out

# check duplicate manifests:
execute store success score *x _slimecore run function slimecore:_/build/pass_1/check_dupe with storage slimecore:_ var.build.this_man
execute unless score *x _slimecore matches 1 run function slimecore:_/build/pass_1/update_map with storage slimecore:_ var.build.this_man

# check multiple impls:
data modify storage slimecore:_ var.build.impls set from storage slimecore:_ var.build.this_man.implements
execute if data storage slimecore:_ var.build.impls[0] run function slimecore:_/build/pass_1/impls/each

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_1/each