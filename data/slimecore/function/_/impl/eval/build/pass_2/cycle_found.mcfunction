# IMPL > slimecore:eval/build
# pass_2/cycle_found

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.dependency_cycles[0] run data modify storage slimecore:out build.result.error.dependency_cycles set value []

data modify storage slimecore:out build.result.error.dependency_cycles append from storage slimecore:_ v.build.depstack
data modify storage slimecore:out build.result.error.dependency_cycles[-1] append from storage slimecore:_ v.build.this_eval