#> slimecore : rebuild
#--------------------
# -> disable?: [PackReference]
# -> enable?: [PackReference]
# -> uninstall?: [PackReference]
#--------------------
# <- result: EvalResult<{
#   uninstalled: [DatapackLink]
#   disabled: [DatapackLink],
#   enabled: [DatapackLink],
# }, {
#   build_error?: eval::build::Error
#   missing_datapack_paths?: [{
#       ...PackReference
#       path_override?: DatapackPath
#   }]
# }
#--------------------
# TODO: description
#--------------------
# 1: success
# 0: error
#--------------------

data remove storage slimecore:out rebuild

execute unless data storage slimecore:in rebuild.disable run data modify storage slimecore:in rebuild.disable set value []
execute unless data storage slimecore:in rebuild.enable run data modify storage slimecore:in rebuild.enable set value []
execute unless data storage slimecore:in rebuild.uninstall run data modify storage slimecore:in rebuild.uninstall set value []

execute store result score *x _slimecore run function slimecore:_/impl/rebuild/main

data remove storage slimecore:_ v.rebuild
data remove storage slimecore:in rebuild
scoreboard players reset *rebuild.success

return run scoreboard players get *x _slimecore