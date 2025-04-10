# slimecore:_/build/second_pass/depstack/cycle_found
#--------------------
# ./each
#--------------------

scoreboard players set *build.error _slimecore 1
data modify storage slimecore:_ _.build.errors.dependency_cycles append value {}
data modify storage slimecore:_ _.build.errors.dependency_cycles[-1].root set from storage build.this_parent
data modify storage slimecore:_ _.build.errors.dependency_cycles[-1].cycle set from storage slimecore:_ _.build.e.depcycle

