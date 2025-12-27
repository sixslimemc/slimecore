#> slimecore : rebuild

data remove storage slimecore:out rebuild

execute unless data storage slimecore:in rebuild.uninstall run data modify storage slimecore:in rebuild.uninstall set value []
execute unless data storage slimecore:in rebuild.force_clean run data modify storage slimecore:in rebuild.force_clean set value false
execute store success score *rebuild.inherit_disables _slimecore unless data storage slimecore:in rebuild.disable
execute unless data storage slimecore:in rebuild.disable run data modify storage slimecore:in rebuild.disable set value []

execute store result score *x _slimecore run function slimecore:_/impl/rebuild/main

data remove storage slimecore:in rebuild
scoreboard players reset *rebuild.error
scoreboard players reset *rebuild.success
scoreboard players reset *rebuild.found_path
scoreboard players reset *rebuild.inherit_disables

return run scoreboard players get *x _slimecore