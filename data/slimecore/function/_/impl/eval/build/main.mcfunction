# IMPL > slimecore:eval/build
# main

data remove storage slimecore:_ v.build
execute store result score *x _slimecore run function slimecore:_/impl/eval/build/process

# error fixing:
execute if data storage slimecore:out build.result.error.duplicate_pack_ids[0] run data remove storage slimecore:out build.result.error.multiple_implementations

return run scoreboard players get *x _slimecore