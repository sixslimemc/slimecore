#> slimecore:manifest
#--------------------
# &PackOrderSpec := 'BEFORE' | 'AFTER' | 1b | -1b
# &ManifestPackRequirement := { pack: PackID, version: {major: int, minor: int}, load: &PackOrderSpec = 'BEFORE', pre_load: &PackOrderSpec = 'BEFORE', post_load: &PackOrderSpec = 'BEFORE' }
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# => abstract: bool = false
# => dependencies[]: &ManifestPackRequirement = []
# => supports[]: &ManifestPackRequirement = []
# => implements[]: AbstractRequirement = []
#--------------------
# .
#--------------------
# The manifest function.
#--------------------
# .
#--------------------

data modify storage slimecore:_ init.manifests append from storage slimecore:in manifest
data remove storage slimecore:in manifest

# ORDER OF OPS/FAIL
#- invalid data
#- duplicate packs
#- impossible dependency order
#- missing dep
#- missing impl


#- "confirmed_order" (for all load/pre/post) PackID[]
#- "invalid_orderings" mapping PackID -> (List of relations {PackID: -1 | 1})
#- "required_packs" mapping PackID -> {url: string, needers[]: {pack: PackID, needs: Version}}
#- "unimpled_abstracts" mapping PackID -> Version
#- "total_impls" mapping abstract PackID -> implementing PackInfo
#- "total_packs" mapping PackID -> PackInfo

# "problems" (read at end)
#- "duplicates" list of {pack: PackID, versions[]: Version}
#- "duplicate_impls" list of {abstract: PackID, impls[]: PackID}
#- "invalid_orderings"
#- "incompatible_packs"
#- "missing_deps" list of {pack: PackID, }
#- "missing_impls"