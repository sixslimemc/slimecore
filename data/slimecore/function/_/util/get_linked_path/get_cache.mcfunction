# UTIL > slimecore:_/util/get_linked_path
# get_caache
#--------------------
# ./do
#--------------------

$execute store success score *get_linked_path.cached _slimecore run data modify storage slimecore:_/out get_linked_path set from storage slimecore:_ data.cached_paths."$(author_id).$(pack_id).$(major).$(minor).$(patch)"
execute if score *get_linked_path.cached _slimecore matches 1 run return run execute unless data storage slimecore:_/out {get_linked_path:false}