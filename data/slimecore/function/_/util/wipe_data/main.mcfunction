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

data modify storage slimecore:data world set value {installed:[], aux:{installed_map:{}}}

return 1
