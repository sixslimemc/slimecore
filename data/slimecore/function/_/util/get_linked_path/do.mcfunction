# UTIL > slimecore:_/util/get_linked_path
# do
#--------------------
# ./main
#--------------------

# check cached (if not *.force_load):
scoreboard players set *get_linked_path.cached _slimecore 0
execute if score *get_linked_path.force_load _slimecore matches 0 store result score *x _slimecore run function slimecore:_/util/get_linked_path/get_cache
execute if score *get_linked_path.force_load _slimecore matches 0 if score *get_linked_path.cached _slimecore matches 1 run return run scoreboard players get *x _slimecore

# check override:
$data modify storage slimecore:_/out get_linked_path.path_override set from storage slimecore:config datapack_path_overrides."$(pack_id)"
data modify storage slimecore:_ x.path set from storage slimecore:_/out get_linked_path.path_override
execute if data storage slimecore:_/out get_linked_path.path_override run return run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x

# try fully qualified:
$data modify storage slimecore:_ x.path set value "file/$(author_id).$(pack_id).$(major).$(minor).$(patch)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try fully qualified zip:
$data modify storage slimecore:_ x.path set value "file/$(author_id).$(pack_id).$(major).$(minor).$(patch).zip"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try dev path:
$data modify storage slimecore:_ x.path set value "file/$(pack_id)"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

# try dev path zip:
$data modify storage slimecore:_ x.path set value "file/$(pack_id).zip"
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/check with storage slimecore:_ x
execute if score *x _slimecore matches 1 run return 1

return 0