#> slimecore:_/impl/evaluate/manifest/datafix/requirements/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ impl.manifest.datafix.this_req set from storage slimecore:_ impl.manifest.datafix.requirements.in[-1]

# loads:
data modify storage slimecore:_ impl.manifest.datafix.load_words set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ impl.manifest.datafix.load_words[0] run function slimecore:_/impl/evaluate/manifest/datafix/requirements/loads/each

data modify storage slimecore:_ impl.manifest.datafix.requirements.out append from storage slimecore:_ impl.manifest.datafix.this_req

data remove storage slimecore:_ impl.manifest.datafix.requirements.in[-1]
execute if data storage slimecore:_ impl.manifest.datafix.requirements.in[0] run function slimecore:_/impl/evaluate/manifest/datafix/requirements/each