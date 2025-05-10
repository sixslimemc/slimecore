#> slimecore:_/impl/evaluate/manifest/validate/composite/load_spec
#--------------------
# 
#--------------------

data modify storage slimecore:_ impl.manifest.validate.load_words set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ impl.manifest.validate.load_words[0] run function slimecore:_/impl/evaluate/manifest/validate/composite/loads/each
