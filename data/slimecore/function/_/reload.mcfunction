#> slimecore:_/reload
# MINECRAFT : LOAD

# if building, ignore reload and continue building:
execute if score *building _slimecore matches 1.. run return run function slimecore:_/rebuild/continue

# setup:
scoreboard objectives add _slimecore dummy

# set slimecore metadata:
data remove storage slimecore:data slimecore
data modify storage slimecore:data slimecore set value {pack_id:"slimecore", author_id:"sixslime", dependencies:[], abstract_declarations:[], abstract_implementations:[], entrypoints:[], preload_entrypoints:[], display:{name:"SlimeCore", author_name:"SixSlime", summary:"The SlimeCore framework.", links:{author:"https://github.com/sixslimemc", info:"https://github.com/sixslimemc/slimecore", versions:"TODO"}}, url:"TODO", version:{major:1, minor:0, patch:0}}
# bug with spyglass gives an error if this is set normally:
data modify storage slimecore:data slimecore.is_library set value false

# DEBUG
scoreboard players reset *init _slimecore

# init:
execute unless score *init _slimecore matches 1 run function slimecore:_/init
scoreboard players set *init _slimecore 1

# if automatic rebuild disabled, load and return:
execute if data storage slimecore:config {explicit_rebuild_only:true} run return run function slimecore:_/load/main

# rebuild:
function slimecore:rebuild