#> slimecore:_/impl/evaluate/safe_uninstalls/pass_1/try_remove
#--------------------
# ./each
#--------------------

$execute store success score *x _slimecore run data remove storage slimecore:_ v.safe_uninstalls.current_packs[{pack:'$(pack)'}]
# add to {..valid_uninstalls} if found
execute if score *x _slimecore matches 1 run data modify storage slimecore:_ v.safe_uninstalls.valid_uninstalls append from storage slimecore:_ v.safe_uninstalls.uninstalls[0]
execute if score *x _slimecore matches 1 run return 1

# this uninstall does not exist in build:
data modify storage slimecore:out safe_uninstalls.not_in_build append from storage slimecore:_ v.safe_uninstalls.uninstalls[0]