#> slimecore :_/util/ get_linked_path
#--------------------
# -> pack: PartialPackInfo
#--------------------
# <- result?: DatapackPath
#--------------------
# TODO: description
#--------------------
# 1: path found
# 0: path not found
#--------------------

data remove storage slimecore:_/out get_linked_path

execute summon text_display store result score *x _slimecore run function slimecore:_/util/get_linked_path/do with storage slimecore:_/in get_linked_path.pack

data remove storage slimecore:_ u.get_linked_path
data remove storage slimecore:_/in get_linked_path

return run scoreboard players get *x _slimecore