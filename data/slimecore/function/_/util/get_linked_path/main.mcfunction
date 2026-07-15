#> slimecore :_/util/ get_linked_path
#--------------------
# -> pack: PartialPackInfo
#--------------------
# <- path?: DatapackPath
# <- path_override?: DatapackPath
# <= force_load?: boolean = false
#--------------------
# entire output can be `false` if no path found.
#--------------------
# 1: path found
# 0: path not found
#--------------------

data modify storage slimecore:_/out get_linked_path set value {}
execute store success score *get_linked_path.force_load _slimecore if data storage slimecore:_/in get_linked_path{force_load:true}

data modify storage slimecore:_ u.get_linked_path.macro set from storage slimecore:_/in get_linked_path.pack
data modify storage slimecore:_ u.get_linked_path.macro merge from storage slimecore:_/in get_linked_path.pack.version
execute store result score *get_linked_path.found _slimecore run function slimecore:_/util/get_linked_path/do with storage slimecore:_ u.get_linked_path.macro

execute if score *get_linked_path.cached _slimecore matches 0 run function slimecore:_/util/get_linked_path/cache with storage slimecore u.get_linked_path.macro

data remove storage slimecore:_ u.get_linked_path
data remove storage slimecore:_/in get_linked_path
scoreboard players reset *get_linked_path.cached _slimecore
scoreboard players reset *get_linked_path.force_load _slimecore
scoreboard players reset *get_linked_path.found _slimecore

return run scoreboard players get *x _slimecore