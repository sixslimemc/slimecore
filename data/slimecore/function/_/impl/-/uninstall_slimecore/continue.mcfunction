# IMPL > slimecore:-/uninstall_slimecore
# continue
#--------------------
# _/reload
#--------------------

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

tellraw @s [{text: "SlimeCore successfully uninstalled.", color: "dark_green", bold:true}]
tellraw @s [{text: "All datapacks that rely on SlimeCore (should) have been properly disabled.", color: "dark_green"}]
tellraw @s [{text: "Please remove the SlimeCore datapack from this world's 'datapack' folder before the next reload.", color: "yellow"}]
