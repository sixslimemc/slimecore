#> slimecore:_/impl/manifest/require/each
#--------------------
# ./do
#--------------------

data modify storage slimecore:_ impl.manifest.macro.field set from storage slimecore:_ impl.manifest.required[-1]

function slimecore:_/impl/manifest/require/each.1 with storage slimecore:_ impl.manifest.macro

data remove storage slimecore:_ impl.manifest.required[-1]
execute if data storage slimecore:_ impl.manifest.required[0] run function slimecore:_/impl/manifest/require/each