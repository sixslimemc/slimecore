#> slimecore:_/init
#--------------------
# ./reload
#--------------------

data modify storage slimecore:config datapack_path_override set value {}

data remove storage slimecore:config build_time_gamerules
data modify storage slimecore:config build_time_gamerules.max_command_forks set value 2147483647
data modify storage slimecore:config build_time_gamerules.max_command_sequence_length set value 2147483647

data modify storage slimecore:config force_manual_rebuild set value false
