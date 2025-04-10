#> slimecore:_/build/second_pass/each
#--------------------
# ../start
#--------------------

data modify storage slimecore:_ _.build.this_manifest set from storage slimecore:_ _.build.manifests[-1]

data modify storage slimecore:_ _.build.depstack set value []
data modify storage slimecore:_ _.build.evalroot set from storage slimecore:_ _.build.this_manifest
function slimecore:_/build/second_pass/eval

data remove storage slimecore:_ _.build.manifests[-1]
execute if data storage slimecore:_ _.build.manifests[0] run function slimecore:_/build/second_pass/each
