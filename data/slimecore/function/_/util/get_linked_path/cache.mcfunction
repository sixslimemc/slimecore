# UTIL > slimecore:_/util/get_linked_path
# cache
#--------------------
# ./main
#--------------------

execute if score *get_linked_path.found _slimecore matches 1 run data modify storage slimecore:_ x.entry set from storage slimecore:_/out get_linked_path
execute if score *get_linked_path.found _slimecore matches 0 run data modify storage slimecore:_ x.entry set value false
$data modify storage slimecore:_ data.cached_paths."$(author_id).$(pack_id).$(major).$(minor).$(patch)" set from storage slimecore:_ x.entry
