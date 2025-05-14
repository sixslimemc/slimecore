#> slimecore:_/init/uninstall/do
#--------------------
# ../main
#--------------------

# DEBUG:
data modify storage slimecore:_ var.init.debug.uninstall_marked append from storage slimecore:data uninstall_marked[].pack
tellraw @a [{text:"> Uninstalling Packs", color:dark_purple}]

# evaluate:
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
data modify storage slimecore:in safe_uninstalls.uninstalls set from storage slimecore:data uninstall_marked
execute store result score *x _slimecore run function slimecore:evaluate/safe_uninstalls

execute if data storage slimecore:out safe_uninstalls.not_in_build[0] run tellraw @a [{text:"- Not in Build: ", color:dark_gray}, {'storage':'slimecore:out', 'nbt':'safe_uninstalls.not_in_build', color:dark_gray}]

execute if data storage slimecore:out safe_uninstalls.unsafe[0] run tellraw @a [{text:"> Uninstall Failed: ", color:red}, {'storage':'slimecore:out', 'nbt':'safe_uninstalls.unsafe', color:dark_aqua}]

execute if score *x _slimecore matches 0 run return 0
execute unless data storage slimecore:out safe_uninstalls.safe[0] run return 0

data modify storage slimecore:_ var.init.uninstalling set from storage slimecore:out safe_uninstalls.safe
data modify storage slimecore:_ var.init.packs set from storage slimecore:data current_build.packs

# DEBUG:
data modify storage slimecore:_ var.init.debug.safe_uninstalls append from storage slimecore:_ var.init.uninstalling[].pack

# each uninstall:
execute if data storage slimecore:_ var.init.uninstalling[0] run function slimecore:_/init/uninstall/uninstalling/each with storage slimecore:_ var.init.uninstalling[0]

# DEBUG:
tellraw @a [{text:"> Successfully Uninstalled: ", color:dark_green}, {'storage':'slimecore:_', 'nbt':'var.init.debug.safe_uninstalls', color:light_purple}]

# rebuild:
function slimecore:_/init/rebuild