# UTIL > slimecore:_/util/get_linked_path
# do
#--------------------
# ./main
#--------------------
kill @s

# check override:
$data modify storage slimecore:_ v.get_linked_path.path set from storage slimecore:config datapack_path_override_map."$(pack_id)"
execute if data storage slimecore:_ v.get_linked_path.path run return run function slimecore:_/util/get_linked_path/check with storage slimecore:_ v.get_linked_path

# try versioned:
data modify entity @s text set value ["file/", {storage:"slimecore:_/in", nbt:"get_linked_path.pack.pack_id"}, " v", {storage:"slimecore:_/in", nbt:"get_linked_path.pack.version.major"}, ".", {storage:"slimecore:_/in", nbt:"get_linked_path.pack.version.minor"}, ".", {storage:"slimecore:_/in", nbt:"get_linked_path.pack.version.patch"}]
data modify storage slimecore:_ x.path set from entity @s text
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try unversioned:
data modify entity @s text set value ["file/", {storage:"slimecore:_/in", nbt:"get_linked_path.pack.pack_id"}]
data modify storage slimecore:_ x.path set from entity @s text
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

return 0