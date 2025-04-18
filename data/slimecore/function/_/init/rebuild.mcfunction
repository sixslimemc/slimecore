#> slimecore:_/init/rebuild
#--------------------
# ./main
#--------------------

# DEBUG:
tellraw @a {'text':"> Rebuild Start", 'color': yellow}

data modify storage slimecore:in build.packs set from storage slimecore:_ var.init.packs
execute store result score *x _slimecore run function slimecore:evaluate/build

# failure:
# DEBUG:
execute if score *x _slimecore matches 0 run tellraw @a [{'text': "> Build Failed: ", 'color': red}, {'storage':'slimecore:out', 'nbt':'build.error', 'color': dark_aqua}]
execute if score *x _slimecore matches 0 run return 0

#success:
# DEBUG:
tellraw @a [{'text': "> Build Success", 'color': green}]

data modify storage slimecore:data current_build set from storage slimecore:out build.value

return 1