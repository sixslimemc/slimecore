# IMPL > slimecore:eval/build
# pass_4/entrypoints/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoints[-1]

execute unless data storage slimecore:_ v.build.this_entrypoint.before[0] run data modify storage slimecore:_ v.build.this_entrypoint.before set value []
execute unless data storage slimecore:_ v.build.this_entrypoint.after[0] run data modify storage slimecore:_ v.build.this_entrypoint.after set value []

data modify storage slimecore:_ v.build.evalin append value {id:"", pack_ref:""}
data modify storage slimecore:_ v.build.evalin[-1].id set from storage slimecore:_ v.build.this_entrypoint.id
data modify storage slimecore:_ v.build.evalin[-1].pack_ref append from storage slimecore:_ v.build.this_pack.pack_id
function slimecore:_/impl/eval/build/pass_4/entrypoints/eval

data remove storage slimecore:_ v.build.entrypoints[-1]
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/each