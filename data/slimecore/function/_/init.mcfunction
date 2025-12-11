#> slimecore:_/init
#--------------------
# ./reload
#--------------------

# DEBUG
return 0

data modify storage slimecore:config datapack_path_override_map set value {}

data remove storage slimecore:config build_time_gamerules
data modify storage slimecore:config build_time_gamerules.max_command_forks set value 2147483647
data modify storage slimecore:config build_time_gamerules.max_command_sequence_length set value 2147483647

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

data modify storage slimecore:config explicit_rebuild_only set value false

# empty build data:
function slimecore:_/util/wipe_data/main