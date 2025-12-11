#> slimecore :_/util/ get_linked_path
#--------------------
# -> pack: PartialPackInfo
#--------------------
# <- path?: DatapackPath
# <- path_override?: DatapackPath
#--------------------
# TODO: description
#--------------------
# 1: path found
# 0: path not found
#--------------------

data modify storage slimecore:_/out get_linked_path set value {}

data modify storage slimecore:_ x.macro set from storage slimecore:_/in get_linked_path.pack
data modify storage slimecore:_ x.macro merge from storage slimecore:_/in get_linked_path.pack.version
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/do with storage slimecore:_ x.macro

data remove storage slimecore:_ u.get_linked_path
data remove storage slimecore:_/in get_linked_path

return run scoreboard players get *x _slimecore