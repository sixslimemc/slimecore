# IMPL > slimecore:eval/pack
# dependencies/invalid_version
#--------------------
# ./each
#--------------------
scoreboard players set *pack.error _slimecore 1

execute if score *pack.dep_err _slimecore matches 0 run data modify storage slimecore:out pack.result.error.invalid_dependencies append value {index:0, reason:{}}
execute if score *pack.dep_err _slimecore matches 0 store result storage slimecore:out pack.result.error.invalid_dependencies[-1].index int 1 run scoreboard players get *pack.index _slimecore

data modify storage slimecore:out pack.result.error.invalid_dependencies[-1].reason.invalid_download_url set value true

scoreboard players set *pack.dep_err _slimecore 1