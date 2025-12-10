#> slimecore : rebuild
#--------------------
# -> disable?: [PackReference]
# -> uninstall?: [PackReference]
# -> force_clean?: boolean
#--------------------
# -> result: EvalResult<{
#   uninstall_paths: [DatapackPath]
# }, {
#   build_error?: eval::build::Error,
#   missing_datapack_paths?: [{
#       for: PartialPackInfo,
#       path_override?: DatapackPath,
#   }]
# }
#--------------------
# TODO: description
#--------------------
# 1: success
# 0: error
#--------------------

data modify storage slimecore:out rebuild set value {}

execute unless data storage slimecore:in rebuild.disable run data modify storage slimecore:in rebuild.disable set value []
execute unless data storage slimecore:in rebuild.uninstall run data modify storage slimecore:in rebuild.uninstall set value []
execute unless data storage slimecore:in rebuild.force_clean run data modify storage slimecore:in rebuild.force_clean set value false

execute store result score *x _slimecore run function slimecore:_/impl/rebuild/main

data remove storage slimecore:in rebuild

return run scoreboard players get *x _slimecore