# IMPL > slimecore:eval/build
# pass_3/cycle_found

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.dependency_cycles[0] run data modify storage slimecore:out build.result.error.dependency_cycles set value []

data modify storage slimecore:out build.result.error.dependency_cycles append value {cycle:[]}
data modify storage slimecore:out build.result.error.dependency_cycles[-1].cycle set from storage slimecore:_ v.build.depstack
data modify storage slimecore:out build.result.error.dependency_cycles[-1].cycle append from storage slimecore:_ v.build.this_dep