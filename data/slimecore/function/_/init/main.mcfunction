
# init declarations:
scoreboard objectives add _slimecore dummy

# DEBUG:
scoreboard players reset *installed _slimecore
tellraw @a {"text":">> RELOAD <<", "bold": true, "color": blue}

# consts:
execute unless score *installed _slimecore matches 1 run function slimecore:_/def_consts/main

# gather manifests:
data modify storage slimecore:_ manifests set value {valid:[], invalid:[], uninstalling:[]}
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# check if rebuild needed:
data merge storage slimecore:_ {var:{init:{packs:[]}}}
data modify storage slimecore:_ var.init.packs append from storage slimecore:_ manifests.valid[].pack_info
data modify storage slimecore:_ var.init.compare set from storage slimecore:data current_build.packs
execute store success score *init.do_rebuild _slimecore run data modify storage slimecore:_ var.init.compare set from storage slimecore:_ var.init.packs
execute if data storage slimecore:config debug.build{disable_rebuild:true} run scoreboard players set *init.do_rebuild _slimecore 0

#DEBUG:
scoreboard players set *init.do_rebuild _slimecore 1

# rebuild call:
execute if score *init.do_rebuild _slimecore matches 1 run function slimecore:_/init/rebuild

# DEBUG:
execute unless score *init.do_rebuild _slimecore matches 1 run tellraw @a [{'text':'> No Rebuild Needed', 'color':gray}]
data modify storage slimecore:_ var.init.debug.load_order append from storage slimecore:data current_build.order.load[].pack
tellraw @a [': ', {'storage':'slimecore:_', 'nbt':'var.init.debug.load_order', 'color':aqua}]

# do uninstalls:
execute if data storage slimecore:_ manifests.uninstalling[0] run function slimecore:_/init/uninstalls/each
data modify storage slimecore:data uninstall set value {safe:[], unsafe:[]}

# call load tags:
data modify storage slimecore:_ var.init.load_tags set from storage slimecore:_ const.load_tags
execute if data storage slimecore:_ var.init.load_tags[0] run function slimecore:_/init/load_tags/each

# end
data remove storage slimecore:_ var.init
scoreboard players reset *init.do_rebuild _slimecore

scoreboard players set *installed _slimecore 1

# DEBUG:
tellraw @a {"text":">> REACHED END <<", "bold": true, "color": green}