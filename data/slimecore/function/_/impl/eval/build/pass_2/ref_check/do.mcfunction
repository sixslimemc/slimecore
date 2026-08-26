# IMPL > slimecore:eval/build
# pass_2/ref_check/do
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ v.build.has_err_entry set value false

# check entrypoints:
data modify storage slimecore:_ v.build.ref_type set value 1
data modify storage slimecore:_ v.build.key_parts set value [{key:"entrypoints", index:0}]
data modify storage slimecore:_ v.build.check_key set value "entrypoints"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/entrypoints/each

# check preload entrypoints:
data modify storage slimecore:_ v.build.ref_type set value 2
data modify storage slimecore:_ v.build.key_parts set value [{key:"preload_entrypoints", index:0}]
data modify storage slimecore:_ v.build.check_key set value "preload_entrypoints"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.preload_entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/entrypoints/each

# check abstract impls:
data modify storage slimecore:_ v.build.ref_type set value 3
data modify storage slimecore:_ v.build.key_parts set value [{key:"abstract_implementations", index:0}]
data modify storage slimecore:_ v.build.check_key set value "abstract_declarations"
data modify storage slimecore:_ v.build.checks set from storage slimecore:_ v.build.this_pack.abstract_implementations
execute if data storage slimecore:_ v.build.checks[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/each