#> slimecore : evaluate/manifest
#--------------------
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# -> author: PackAuthor
# -> preferred_order: LoadSpec<ManifestRelativeOrder>
# => abstract: bool = false
# => dependencies[]: ManifestPackRequirement = []
# => supports[]: ManifestPackRequirement = []
# => implements[]: PackID | PackReference = []
#--------------------
# <~ value? PackInfo
# <~ error? ManifestEvaluationError
#--------------------
# TODO: description
#--------------------
# 1: valid manifest; >result< contains data.
# 0: invalid manifest; >error< contains data.
#--------------------

data remove storage slimecore:out manifest

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/main

data remove storage slimecore:in manifest
data remove storage slimecore:_ impl.manifest

return run scoreboard players get *x _slimecore