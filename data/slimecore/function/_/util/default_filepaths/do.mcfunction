# UTIL > slimecore:_/util/default_filepaths
# do
#--------------------
# ./main
#--------------------
kill @s

data modify entity @s text set value ["file/",{storage:"slimecore:_/in", nbt:"default_filepaths.pack_id"}]
data modify storage slimecore:_/out default_filepaths.result.unversioned set from entity @s text

data modify entity @s text set value ["file/",{storage:"slimecore:_/in", nbt:"default_filepaths.pack_id"}, " v",{storage:"slimecore:_/in", nbt:"default_filepaths.version.major"}, ".",{storage:"slimecore:_/in", nbt:"default_filepaths.version.minor"}, ".",{storage:"slimecore:_/in", nbt:"default_filepaths.version.patch"}]
data modify storage slimecore:_/out default_filepaths.result.versioned set from entity @s text