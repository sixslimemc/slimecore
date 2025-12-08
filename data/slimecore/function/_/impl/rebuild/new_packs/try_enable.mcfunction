# IMPL > slimecore:rebuild
# new_packs/try_enable
#--------------------
# ./each
#--------------------

$datapack disable "$(path)"
$execute store success score *x _slimecore run datapack enable "$(path)" last
$execute if score *x _slimecore matches 1 run data modify storage slimecore:_ v.rebuild.linked_path set value "$(path)"
return run scoreboard players get *x _slimecore
