# IMPL > slimecore:eval/build
# pass_4/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]

data modify storage slimecore:_ v.build.evalin set value []
data modify storage slimecore:_ v.build.eval set value []
data modify storage slimecore:_ v.build.map_key set value "entrypoint_befores"
data modify storage slimecore:_ v.build.pack_key set value "entrypoints"
data modify storage slimecore:_ v.build.map_aftercache set value "entrypoint_after_cache"
data modify storage slimecore:_ v.build.map_initial_order set value "entrypoint_initial_order"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/each

data modify storage slimecore:_ v.build.evalin set value []
data modify storage slimecore:_ v.build.eval set value []
data modify storage slimecore:_ v.build.map_key set value "preload_befores"
data modify storage slimecore:_ v.build.pack_key set value "preload_entrypoints"
data modify storage slimecore:_ v.build.map_aftercache set value "preload_after_cache"
data modify storage slimecore:_ v.build.map_initial_order set value "preload_initial_order"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.preload_entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/each

data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_3/each
