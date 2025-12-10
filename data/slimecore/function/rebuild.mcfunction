#> slimecore : rebuild
#--------------------
# -> disable?: [PackReference]
# -> enable?: [PackReference]
# -> uninstall?: [PackReference]
#--------------------
# .
#--------------------
# TODO: description
# - calls hook 'rebuild_result' when done.
#--------------------
# 1.
#--------------------

data remove storage slimecore:out rebuild

execute unless data storage slimecore:in rebuild.disable run data modify storage slimecore:in rebuild.disable set value []
execute unless data storage slimecore:in rebuild.enable run data modify storage slimecore:in rebuild.enable set value []
execute unless data storage slimecore:in rebuild.uninstall run data modify storage slimecore:in rebuild.uninstall set value []

function slimecore:_/impl/rebuild/main

data remove storage slimecore:_ v.rebuild
data remove storage slimecore:in rebuild
scoreboard players reset *rebuild.success

return 1