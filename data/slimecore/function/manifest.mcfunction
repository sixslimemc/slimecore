#> slimecore : manifest
#--------------------
# & PackOrderSpec := 'BEFORE' | 'AFTER' | 'ANY' | 1b | -1b | 0b
# & ManifestPackRequirement := {pack: PackID, version: {major: int, minor: int}, order? LoadSpec<&PackOrderSpec = 1b> = LoadSpec<1b>}
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# -> author: PackAuthor
# ~> abstract: bool = false
# ~> dependencies[]: &ManifestPackRequirement = []
# ~> supports[]: &ManifestPackRequirement = []
# ~> implements[]: PackID | PackProvision = []
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# 1: manifest successfully added to build.
# -1: invalid manifest.
# -2: this function was called outside of manifest-time (not called via #slimecore:manifest).
#--------------------

data remove storage slimecore:out manifest

execute store result score *x _slimecore run function slimecore:_/impl/manifest/main

data remove storage slimecore:in manifest
data remove storage slimecore:_ impl.manifest

return run scoreboard players get *x _slimecore