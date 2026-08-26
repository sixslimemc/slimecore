# IMPL > slimecore:eval/build
# main

data remove storage slimecore:_ v.build
execute store result score *x _slimecore run function slimecore:_/impl/eval/build/process

# error fixing:
execute if data storage slimecore:out build.result.error.duplicate_pack_ids run data remove storage slimecore:out build.result.error.oversatisfied_contracts
execute if data storage slimecore:out build.result.error.unfulfilled_dependencies run data remove storage slimecore:out build.result.error.packs_with_invalid_references

return run scoreboard players get *x _slimecore