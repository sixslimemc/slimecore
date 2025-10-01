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

execute store success score *init.max_chain.overridden _slimecore if data storage slimecore:config build.max_command_chain_length_override
execute store result score *init.max_chain.override _slimecore run data get storage slimecore:config build.max_command_chain_length_override
execute store result score *init.max_chain.original _slimecore run gamerule maxCommandChainLength

# max command chain override:
execute store result storage slimecore:_ x.value int 1 run scoreboard players get *init.max_chain.override _slimecore
execute if score *init.max_chain.overriden _slimecore matches 1 run function slimecore:_/init/set_max_command_chain with storage slimecore:_ x

# gather manifests:
data modify storage slimecore:_ manifests set value {valid:[], invalid:[]}
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore

# DEBUG
execute if data storage slimecore:_ manifests.invalid[0] run tellraw @a [{text:"> Invalid Manifests: ", color: red}, {storage:'slimecore:_', nbt:'manifests.invalid', color: dark_aqua}]

# check if rebuild needed:
data merge storage slimecore:_ {var:{init:{packs:[]}}}
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

# DEBUG:
data modify storage slimecore:_ var.init.debug.load_order append from storage slimecore:data current_build.order.load[].pack
tellraw @a ['# ', {'storage':'slimecore:_', 'nbt':'var.init.debug.load_order', 'color':aqua}]

# create {..load_data}
data remove storage slimecore:_ var.init.load_data
data modify storage slimecore:_ var.init.pack_iter set from storage slimecore:data current_build.packs
execute if data storage slimecore:_ var.init.pack_iter[0] run function slimecore:_/init/load_data/each

# call load tags:
data modify storage slimecore:_ var.init.load_tags set from storage slimecore:_ const.load_tags
execute if data storage slimecore:_ var.init.load_tags[0] run function slimecore:_/init/load_tags/each

# metadata:
scoreboard players set *installed _slimecore 1
data remove storage slimecore:data slimecore
data modify storage slimecore:data slimecore.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:data slimecore.url.this set value "TODO"
data modify storage slimecore:data slimecore.url.latest set value "TODO"

# end:
data remove storage slimecore:_ var.init
scoreboard players reset *init.do_rebuild _slimecore
scoreboard players reset *init.did_rebuild _slimecore
scoreboard players reset *init.max_chain.override
data merge storage slimecore:data {uninstall_marked:[]}

# DEBUG:
tellraw @a {"text":">> REACHED END <<", "bold": true, "color": dark_green}

# TODO/DEV:

# ~ must be last
# max command chain override undo:
execute store result storage slimecore:_ x.value int 1 run scoreboard players get *init.max_chain.original _slimecore
scoreboard players operation *x _slimecore = *init.max_chain.overridden _slimecore
scoreboard players reset *init.max_chain.original
scoreboard players reset *init.max_chain.overridden
execute if score *x _slimecore matches 1 run function slimecore:_/init/set_max_command_chain with storage slimecore:_ x
