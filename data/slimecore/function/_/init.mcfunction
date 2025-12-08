#> slimecore:_/init
#--------------------
# ./reload
#--------------------

data modify storage slimecore:config datapack_path_override_map set value {}

data remove storage slimecore:config build_time_gamerules
data modify storage slimecore:config build_time_gamerules.max_command_forks set value 2147483647
data modify storage slimecore:config build_time_gamerules.max_command_sequence_length set value 2147483647

data modify storage slimecore:config explicit_rebuild_only set value false

# empty build data:
data modify storage slimecore:data build set value {packs:[], order:{entrypoints:[], load:[], preload_entrypoints:[]}, aux:{impl_map:{}, pack_map:{}}}
data modify storage slimecore:data world set value {datapack_links:[], aux:{datapack_link_map:{}}}
