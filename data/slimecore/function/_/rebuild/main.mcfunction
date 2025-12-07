#> slimecore:_/rebuild/main
#--------------------
# _/reload
# -/rebuild
#--------------------

data remove storage slimecore:_ var.rebuild

# set gamerules:
function slimecore:_/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players set *manifest_time _slimecore 0

# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ data.packs
execute store result score *x _slimecore run function slimecore:eval/build

# DEBUG / TODO: proper hook
execute if score *x _slimecore matches 0 run tellraw @a {text:"[ BUILD ERROR ]", color: dark_red}
execute if score *x _slimecore matches 0 run tellraw @a {storage:"slimecore:out", nbt:"build.result.error", color: red}
execute if score *x _slimecore matches 0 run return 0

