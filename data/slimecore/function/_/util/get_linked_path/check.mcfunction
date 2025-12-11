# UTIL > slimecore:_/util/get_linked_path
# check
#--------------------
# ./do
#--------------------

$datapack disable "$(path)"
$execute store success score *x _slimecore run datapack enable "$(path)"
$execute if score *x _slimecore matches 1 run data modify storage slimecore:_/out get_linked_path.path set value "$(path)"
return run scoreboard players get *x _slimecore