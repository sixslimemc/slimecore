#> slimecore:_/init/main
#--------------------
# #minecraft:load
#--------------------

# init declarations:
scoreboard objectives add _slimecore dummy

# DEBUG:
scoreboard players reset *installed _slimecore
tellraw @a {"text":">> RELOAD <<", "bold": true, "color": blue}

# consts:
execute unless score *installed _slimecore matches 1 run function slimecore:_/def_consts/main
execute unless score *installed _slimecore matches 1 run function slimecore:_/default_config

# gather manifests:
data modify storage slimecore:_ manifests set value {valid:[], invalid:[]}
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# DEBUG
execute if data storage slimecore:_ manifests.invalid[0] run tellraw @a [{text:"> Invalid Manifests: ", color: red}, {storage:'slimecore:_', nbt:'manifests.invalid', color: dark_aqua}]

# check if rebuild needed:
data modify storage slimecore:_ var.init.packs set value []
data modify storage slimecore:_ var.init.packs append from storage slimecore:_ manifests.valid[].manifest
data modify storage slimecore:_ var.init.compare set from storage slimecore:data current_build.packs
execute store success score *init.do_rebuild _slimecore run data modify storage slimecore:_ var.init.compare set from storage slimecore:_ var.init.packs
execute if data storage slimecore:config debug.build{disable_rebuild:true} run scoreboard players set *init.do_rebuild _slimecore 0

#DEBUG:
# scoreboard players set *init.do_rebuild _slimecore 1

# rebuild call:
execute if score *init.do_rebuild _slimecore matches 1 run function slimecore:_/init/rebuild

# uninstall:
execute if data storage slimecore:data uninstall_marked[0] run function slimecore:_/init/uninstall/do

# DEBUG:
execute unless score *init.did_rebuild _slimecore matches 1 run tellraw @a [{'text':'> No Rebuild Needed', 'color':gray}]

# create {..load_data}
data remove storage slimecore:_ var.init.load_data
data modify storage slimecore:_ var.init.pack_iter set from storage slimecore:data current_build.packs
execute if data storage slimecore:_ var.init.pack_iter[0] run function slimecore:_/init/load_data/each

# DEBUG:
tellraw @a {"text":"> Setup Load Data", "bold": true, "color": dark_gray}

# call load tags:
data modify storage slimecore:_ var.init.load_tags set from storage slimecore:_ const.load_tags
execute if data storage slimecore:_ var.init.load_tags[0] run function slimecore:_/init/load_tags/each

# DEBUG:
data modify storage slimecore:_ var.init.debug.load_order append from storage slimecore:data current_build.order.load[].pack
tellraw @a ['# ', {'storage':'slimecore:_', 'nbt':'var.init.debug.load_order', 'color':aqua}]

# metadata:
scoreboard players set *installed _slimecore 1
data remove storage slimecore:data slimecore
data modify storage slimecore:data slimecore.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:data slimecore.url.this set value "TODO"
data modify storage slimecore:data slimecore.url.latest set value "TODO"

# end:
data remove storage slimecore:_ var.init
scoreboard players reset *init.did_rebuild
scoreboard players reset *init.do_rebuild
data merge storage slimecore:data {uninstall_marked:[]}

# DEBUG:
tellraw @a {"text":">> REACHED END <<", "bold": true, "color": dark_green}
