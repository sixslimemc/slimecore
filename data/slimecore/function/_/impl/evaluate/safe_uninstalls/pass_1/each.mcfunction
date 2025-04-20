#> slimecore:_/impl/evaluate/safe_uninstalls/pass_1/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ impl.safe_uninstalls.this_un set from storage slimecore:_ impl.safe_uninstalls.uninstalls[-1]
# remove this uninstall from {..current_packs} and add it to {..valid_uninstalls} if successful:
function slimecore:_/impl/evaluate/safe_uninstalls/pass_1/try_remove with storage slimecore:_ impl.safe_uninstalls

data remove storage slimecore:_ impl.safe_uninstalls.uninstalls[-1]
execute if data storage slimecore:_ impl.safe_uninstalls.uninstalls[0] run function slimecore:_/impl/evaluate/safe_uninstalls/pass_1/each