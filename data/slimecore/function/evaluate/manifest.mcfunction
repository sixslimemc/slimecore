#> slimecore : evaluate/manifest
#--------------------
# &PackOrderSpec := 'BEFORE' | 'AFTER' | 'ANY' | 1b | -1b | 0b
# &ManifestPackRequirement := {pack: PackID, version: {major: int, minor: int}, order? LoadSpec<&PackOrderSpec = 1b> = LoadSpec<1b>}
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# -> author: PackAuthor
# => abstract: bool = false
# => dependencies[]: &ManifestPackRequirement = []
# => supports[]: &ManifestPackRequirement = []
# => implements[]: PackID | PackProvision = []
#--------------------
# <- result? PackInfo
# <- error?
#--------------------
# The manifest function.
#--------------------
# 1: valid manifest; >result< contains data.
# 0: invalid manifest; >error< contains data.
#--------------------