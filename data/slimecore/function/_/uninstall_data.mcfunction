#> slimecore:_/uninstall_data
#--------------------
# _/impl/-/uninstall_slimecore/confirm
#--------------------

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
