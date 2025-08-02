#> slimecore:_/impl/evaluate/relation/safe_uninstalls/uninstalls/each
#--------------------
# ../main
#--------------------

function slimecore:_/impl/evaluate/relation/safe_uninstalls/pass_2/check_dependencies with storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0]
function slimecore:_/impl/evaluate/relation/safe_uninstalls/pass_2/check_implements with storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0]

execute unless score *safe_uninstalls.unsafe _slimecore matches 1 run data modify storage slimecore:out safe_uninstalls.safe append from storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0]
scoreboard players reset *safe_uninstalls.unsafe _slimecore

data remove storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0]
execute if data storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0] run function slimecore:_/impl/evaluate/relation/safe_uninstalls/pass_2/each