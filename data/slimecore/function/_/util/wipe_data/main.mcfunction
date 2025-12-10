#> slimecore :_/util/ wipe_data
#--------------------
# .
#--------------------
# . 
#--------------------
# wipes slimecore build and world data.
#--------------------
# . 
#--------------------

data modify storage slimecore:data build set value {packs:[], order:{entrypoints:[], load:[], preload_entrypoints:[]}, aux:{impl_map:{}, pack_map:{}}}

data modify storage slimecore:data world set value {datapack_links:[], disabled_packs:[], aux:{datapack_link_map:{}}}

return 1
