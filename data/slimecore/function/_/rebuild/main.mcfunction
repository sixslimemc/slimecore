#> slimecore:_/rebuild/main
#--------------------
# _/reload
# -/rebuild
#--------------------

# reset incase build interrupted:
data remove storage slimecore:_ var.rebuild

# set gamerule overrides and store {..gamerules}
function slimecore:_/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

function slimecore:_/rebuild/process

# restore gamerules:
function slimecore:_/rebuild/set_gamerules with storage slimecore:_ var.rebuild.gamerules

data remove storage slimecore:_ var.rebuild
