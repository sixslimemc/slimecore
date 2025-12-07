#> slimecore:_/rebuild/process
#--------------------
# ./main
#--------------------

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players set *manifest_time _slimecore 0

# DEBUG:
tellraw @a ["", {'storage':'slimecore:_', 'nbt':'data.packs'}]
# evaluate build:
data modify storage slimecore:in build.packs set from storage slimecore:_ data.packs
execute store result score *x _slimecore run function slimecore:eval/build

# DEBUG / TODO: proper hook
execute if score *x _slimecore matches 0 run tellraw @a {text:"[ BUILD ERROR ]", color: dark_red}
execute if score *x _slimecore matches 0 run tellraw @a {storage:"slimecore:out", nbt:"build.result.error", color: red}
execute if score *x _slimecore matches 0 run return 0

# DEBUG
tellraw @a {text:"[ BUILD SUCCESS ]", color: green}
tellraw @a {storage:"slimecore:out", nbt:"build.result.success", color: green}

data modify storage slimecore:data build set from storage slimecore:out build.result.success

# TODO
#- entrypoint ordering dont work