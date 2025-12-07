#> slimecore:_/rebuild/main
#--------------------
# _/reload
# -/rebuild
#--------------------

# reset incase build interrupted:
data remove storage slimecore:_ var.rebuild

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

# set gamerule overrides and store {..gamerules}
function slimecore:_/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

function slimecore:_/rebuild/process

# restore gamerules:
function slimecore:_/rebuild/set_gamerules with storage slimecore:_ var.rebuild.gamerules

data remove storage slimecore:_ var.rebuild
