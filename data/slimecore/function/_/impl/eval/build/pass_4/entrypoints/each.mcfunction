# IMPL > slimecore:eval/build
# pass_4/entrypoints/each

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoints[-1]

execute unless data storage slimecore:_ v.build.this_entrypoint.before[0] run data modify storage slimecore:_ v.build.this_entrypoint.before set value []
execute unless data storage slimecore:_ v.build.this_entrypoint.after[0] run data modify storage slimecore:_ v.build.this_entrypoint.after set value []

data modify storage slimecore:_ v.build.befores set from storage slimecore:_ v.build.this_entrypoint.before
data modify storage slimecore:_ v.build.befores append from storage slimecore:_ v.build.self_befores[]

execute if data storage slimecore:_ v.build.befores[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/befores/each

data modify storage slimecore:_ x.self_before set value {}
data modify storage slimecore:_ x.self_before.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.self_before.id set from storage slimecore:_ v.build.this_entrypoint.id
data modify storage slimecore:_ v.build.self_befores append from storage slimecore:_ x.self_before

data remove storage slimecore:_ v.build.entrypoints[-1]
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/each