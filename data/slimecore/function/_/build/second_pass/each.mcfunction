#> slimecore:_/build/second_pass/each
#--------------------
# ../start
#--------------------

data modify storage slimecore:_ build.this_manifest set from storage slimecore:_ build.manifests[-1]

data modify storage slimecore:_ build.depstack set value []
data modify storage slimecore:_ build.depstack append from storage slimecore:_ build.this_manifest
execute if data storage slimecore:_ build.depstack[0] run function slimecore:_/build/second_pass/eval

data remove storage slimecore:_ build.manifests[-1]
execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/second_pass/each

# PackID -> {needed_by[]: PackID, relations[]: {PackID, order:-1|1}}