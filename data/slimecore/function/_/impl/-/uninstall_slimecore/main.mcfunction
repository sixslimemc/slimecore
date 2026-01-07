# IMPL > slimecore:-/uninstall_slimecore
# main

tellraw @s [{text: "[SlimeCore uninstall initiated]", color: "gray"}]
data modify storage slimecore:_ v.uninstall.packs set from storage slimecore:data world.datapack_links
execute if data storage slimecore:_ v.uninstall.packs[0] run function slimecore:_/impl/-/uninstall_slimecore/packs/each

scoreboard players set *uninstalling _slimecore 1
reload

tellraw @s [{text: "Uninstalling SlimeCore Datapack...", color: "gold"}]

scoreboard objectives remove _slimecore

data remove storage slimecore:data build
data remove storage slimecore:data world
data remove storage slimecore:data slimecore

data remove storage slimecore:config build_time_gamerules
data remove storage slimecore:config datapack_path_overrides
data remove storage slimecore:config explicit_rebuild_only

data remove storage slimecore:_ x
data remove storage slimecore:_ v
data remove storage slimecore:_ u
data remove storage slimecore:_ t
data remove storage slimecore:_ data

tellraw @s [{text: "SlimeCore successfully uninstalled.", color: "dark_green"}]
tellraw @s [{text: "All datapacks that rely on SlimeCore (should) have been properly disabled.", color: "dark_green"}]
tellraw @s [{text: "Please ", color: "dark_green"}]
