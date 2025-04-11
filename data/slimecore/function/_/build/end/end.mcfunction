#> slimecore:_/build/end/end
#--------------------
# ./error
# ./success
#--------------------

data remove storage slimecore:_ var.build
scoreboard players reset *build.has_error_entry _slimecore
scoreboard players reset *build.error _slimecore

scoreboard players reset *build.rel.er _slimecore
scoreboard players reset *build.rel.r _slimecore
scoreboard players reset *build.rel.fail _slimecore
scoreboard players reset *build.rel.should_add _slimecore

scoreboard players reset *build.i_major _slimecore
scoreboard players reset *build.i_minor _slimecore
scoreboard players reset *build.r_major _slimecore
scoreboard players reset *build.r_minor _slimecore
scoreboard players reset *build.bad_index _slimecore