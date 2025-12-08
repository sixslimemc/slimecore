#> slimecore : rebuild
#--------------------
# -> disable?: [PackId]
# -> enable?: [PackId]
# -> uninstall?: [PackId]
#--------------------
# <- result: EvalResult<true, {
#   build_error?: eval::build::Error
#   unsafe_disables?: [eval::safe_disables::UnsafeDisableInfo]
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

execute store result score *x _slimecore run function slimecore:_/impl/rebuild/main

data remove storage slimecore:_ v.rebuild
data remove storage slimecore:in rebuild

return run scoreboard players get *x _slimecore