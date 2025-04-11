#> slimecore:_/build/pass_3/version_check
#--------------------
# ./each
#--------------------

# score storage:
execute store result score *build.i_major _slimecore run data get storage slimecore:_ var.build.installed_dep.version.major
execute store result score *build.i_minor _slimecore run data get storage slimecore:_ var.build.installed_dep.version.minor

execute store result score *build.r_major _slimecore run data get storage slimecore:_ var.build.this_dep.version.major
execute store result score *build.r_minor _slimecore run data get storage slimecore:_ var.build.this_dep.version.minor

# version comparison:
scoreboard players set *build.bad_index _slimecore -1
execute unless score *build.i_minor _slimecore >= *build.r_minor _slimecore run scoreboard players set *build.bad_index _slimecore 1
execute unless score *build.i_major _slimecore = *build.r_major _slimecore run scoreboard players set *build.bad_index _slimecore 0
execute if score *build.bad_index _slimecore matches 0.. run function slimecore:_/build/pass_3/deps/bad_version


execute if score *build.bad_index _slimecore matches 0.. run return fail
return 1