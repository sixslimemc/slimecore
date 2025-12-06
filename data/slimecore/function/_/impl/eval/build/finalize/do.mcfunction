# IMPL > slimecore:eval/build
# finalize/do
#--------------------
# ../process
#--------------------

data remove storage slimecore:out build
data modify storage slimecore:out build.result.success set value {packs:[], order:{load:[], entrypoints:[], preload_entrypoints:[]}, aux:{pack_map:{}, impl_map:{}}}

# set load order:
scoreboard players set *build.index _slimecore 0
execute if data storage slimecore:_ v.build.final_order.loads[0] run function slimecore:_/impl/eval/build/finalize/load_order/each

# set entrypoint order:
scoreboard players set *build.index _slimecore 0
data modify storage slimecore:_ v.build.map_key set value "entrypoints"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.final_order.entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/finalize/entrypoint_order/each

# set preload order:
scoreboard players set *build.index _slimecore 0
data modify storage slimecore:_ v.build.map_key set value "preload_entrypoints"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.final_order.preloads
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/finalize/entrypoint_order/each

# aux maps
data modify storage slimecore:out build.result.success.aux.pack_map set from storage slimecore:_ v.build.maps.packs
data modify storage slimecore:out build.result.success.aux.impl_map set from storage slimecore:_ v.build.maps.impls