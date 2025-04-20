#> slimecore:_/impl/evaluate/safe_uninstalls/uninstalls/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ impl.safe_uninstalls.this_un set from storage slimecore:_ impl.safe_uninstalls.valid_uninstalls[-1]

function slimecore:_/impl/evaluate/safe_uninstalls/pass_2/check_dependencies with storage slimecore:_ impl.safe_uninstalls
function slimecore:_/impl/evaluate/safe_uninstalls/pass_2/check_implements with storage slimecore:_ impl.safe_uninstalls
# TODO: add to safe[] if *unsafe is not 1
execute unless score *safe_uninstalls.unsafe _slimecore matches 1 run data modify storage slimecore:out safe_uninstalls.safe append from storage slimecore:_ impl.safe_uninstalls.this_un
scoreboard players reset *safe_uninstalls.unsafe _slimecore

data remove storage slimecore:_ impl.safe_uninstalls.valid_uninstalls[-1]
execute if data storage slimecore:_ impl.safe_uninstalls.valid_uninstalls[0] run function slimecore:_/impl/evaluate/safe_uninstalls/pass_2/each