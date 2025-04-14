#> slimecore:_/impl/manifest/validate/composite/loads/each
#--------------------
# ../pack_requirement
#--------------------

data modify storage slimecore:_ impl.manifest.validate.this_load set from storage slimecore:_ impl.manifest.validate.load_words[-1]

function slimecore:_/impl/manifest/validate/composite/loads/each.1 with storage slimecore:_ impl.manifest.validate

data remove storage slimecore:_ impl.manifest.validate.load_words[-1]
execute if data storage slimecore:_ impl.manifest.validate.load_words[0] run function slimecore:_/impl/manifest/validate/composite/loads/each
