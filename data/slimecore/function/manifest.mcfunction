#> slimecore : manifest
#--------------------
# -> pack: $PackID
# -> version: Version
# -> url: {this: string, latest? string}
# -> display: {name: string, summary: string}
# -> author: {name: string, url? string}
# => library: bool = false
# => abstract: bool = false
# => dependencies[]: InputPackRequirement = []
# => supports[]: InputPackRequirement = []
# => implements[]: $PackID | PackReference = []
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
data remove storage slimecore:_ v.manifest

return run scoreboard players get *x _slimecore