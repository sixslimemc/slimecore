# UTIL > slimecore:_/util/get_linked_path
# do
#--------------------
# ./main
#--------------------
kill @s

# check override:
$data modify storage slimecore:_/out get_linked_path.path_override set from storage slimecore:config datapack_path_override_map."$(pack_id)"
data modify storage slimecore:_ x.path set from storage slimecore:_/out get_linked_path.path_override
execute if data storage slimecore:_/out get_linked_path.path_override run return run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x

# try authored versioned:
$data modify storage slimecore:_ x.path set value "file/$(author_id).$(pack_id) v$(major).$(minor).$(patch)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try authored unversioned:
$data modify storage slimecore:_ x.path set value "file/$(author_id).$(pack_id)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try unauthored versioned:
$data modify storage slimecore:_ x.path set value "file/$(pack_id) v$(major).$(minor).$(patch)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try unauthored unversioned:
$data modify storage slimecore:_ x.path set value "file/$(pack_id)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

return 0