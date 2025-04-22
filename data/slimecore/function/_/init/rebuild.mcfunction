#> slimecore:_/init/rebuild
#--------------------
# ./main
#--------------------

# DEBUG:
tellraw @a {'text':"> Rebuild Start", 'color': yellow}

# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ var.init.packs
execute store result score *x _slimecore run function slimecore:evaluate/build

# DEBUG:
execute if score *x _slimecore matches 0 run tellraw @a [{'text': "> Build Failed: ", 'color': red}, {'storage':'slimecore:out', 'nbt':'build.error', 'color': dark_aqua}]

# return if failure:
execute if score *x _slimecore matches 0 run return 0

# set to current build:
data modify storage slimecore:data current_build set from storage slimecore:out build.value

# DEBUG:
tellraw @a [{'text': "> Build Success", 'color': green}]


return 1