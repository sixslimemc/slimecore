# IMPL > slimecore:eval/build
# pass_2/eval

$execute store success score *x _slimecore run data modify storage slimecore:_ v.build.eval_seen.'$(pack_ref)' set value true
execute if score *x _slimecore matches 0 run return 0

$data modify storage slimecore:_ v.build.this_eval set value {pack_ref:'$(pack_ref)'}

$execute if data storage slimecore:_ v.build.depstack[{pack_ref:'$(pack_ref)'}] run return run function slimecore:_/impl/eval/build/pass_2/cycle_found