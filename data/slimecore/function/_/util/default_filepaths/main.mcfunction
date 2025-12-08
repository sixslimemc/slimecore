#> slimecore :_/util/ default_filepaths
#--------------------
# -> pack_id: PackId
# -> version: Version
#--------------------
# <- result: {
#   versioned: DatapackPath,
#   unversioned: DatapackPath,
# }
#--------------------
# returns the 2 default datapack paths for <pack_id> of version <version>
#--------------------
# 1.
#--------------------

data remove storage slimecore:_/out default_filepaths

execute summon text_display run function slimecore:_/util/default_filepaths/do
data remove storage slimecore:_/in default_filepaths

return 1