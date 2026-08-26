# IMPL > slimecore:eval/build
# pass_2/ref_check/checks/check
#--------------------
# ./each
#--------------------

$execute store success score *x _slimecore if data storage slimecore:_ v.build.maps.packs.'$(pack_ref)'.'$(check_key)'[{id:'$(id)'}]

return run scoreboard players get *x _slimecore