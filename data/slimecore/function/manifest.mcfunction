#> slimecore : manifest
#--------------------
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# -> author: PackAuthor
# ~> abstract: bool = false
# ~> dependencies[]: ManifestPackRequirement = []
# ~> supports[]: ManifestPackRequirement = []
# ~> implements[]: PackID | PackReference = []
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# 1: manifest successfully added to build.
# -1: invalid manifest.
# -2: this function was called outside of manifest-time (not called via #slimecore:manifest).
# -3: this <pack> is marked for uninstallation, it's #uninstall tag is about to be called.
#--------------------

data remove storage slimecore:out manifest

execute store result score *x _slimecore run function slimecore:_/impl/manifest/main

data remove storage slimecore:in manifest
data remove storage slimecore:_ impl.manifest

return run scoreboard players get *x _slimecore