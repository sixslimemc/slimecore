#> slimecore:_/impl/manifest/datafix/requirements/loads/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ impl.manifest.datafix.this_load set from storage slimecore:_ impl.manifest.datafix.load_words[-1]

function slimecore:_/impl/manifest/datafix/requirements/loads/each.1 with storage slimecore:_ impl.manifest.datafix

data remove storage slimecore:_ impl.manifest.datafix.load_words[-1]
execute if data storage slimecore:_ impl.manifest.datafix.load_words[0] run function slimecore:_/impl/manifest/datafix/requirements/loads/each