# IMPL > slimecore:eval/build
# process
#--------------------
# ./main
#--------------------

scoreboard players set *build.error _slimecore 0

# (pack's id) => (its manifest)
data modify storage slimecore:_ v.build.maps.packs set value {}

# (abstract's source) => (abstract's id) => (its implementation's manifest)
data modify storage slimecore:_ v.build.maps.impls set value {}

# (source pack id) => (entrypoint id) => {<pack ids...>:{<ids...>:true}} (for every entrypoint that this entrypoint comes before)
data modify storage slimecore:_ v.build.maps.entrypoint_befores set value {}
data modify storage slimecore:_ v.build.maps.preload_befores set value {}

# (pack id) => {<pack ids...>: true}
data modify storage slimecore:_ v.build.maps.load_afters set value {}

# (source pack id) => (entrypoint id) => [EntrypointReference<T>] (packs that should be added to 'before', found through 'after' relations)
data modify storage slimecore:_ v.build.maps.entrypoint_after_cache set value {}
data modify storage slimecore:_ v.build.maps.preload_after_cache set value {}

# "<source pack id>;<entrypoint id>" => EntrypointReference<T>
data modify storage slimecore:_ v.build.maps.entrypoint_initial_order set value {}
data modify storage slimecore:_ v.build.maps.preload_initial_order set value {}

# pass 1:
#- check duplicate packs
#- check multiple implementations
#- populate {..maps.manifests}
#- populate {..maps.impls}
#- populate {..maps.entrypoint_after_cache}
#- populate {..maps.preload_after_cache}
data modify storage slimecore:_ v.build.packs set from storage slimecore:in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 2:
#- check dependencies fulfilled
#- check interfaces implemented
data modify storage slimecore:_ v.build.packs set from storage slimecore:in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 3:
#- check dependency cycles
#- populate {..maps.load_afters}
data modify storage slimecore:_ v.build.eval_seen set value {}
data modify storage slimecore:_ v.build.packs set from storage slimecore:in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_3/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 4:
#- populate {..maps.entrypoint_befores}
#- populate {..maps.preload_befores}
#- populate {..maps.entrypoint_initial_order}
#- populate {..maps.preload_initial_order}
data modify storage slimecore:_ v.build.packs set from storage slimecore:in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_4/each
execute if score *build.error _slimecore matches 1 run return 0

# get initial entrypoint orders (based off built-in string key ordering):
# ~ note that this will be the reverse of actual initial order.
data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.maps.entrypoint_initial_order
function slimecore:_/util/kvpairs/main
# DEBUG:
tellraw @a ["out: ", {'storage':'slimecore:_/out', 'nbt':'kvpairs.result'}]
data modify storage slimecore:_ v.build.initial_orders.normal set value []
data modify storage slimecore:_ v.build.initial_orders.normal append from storage slimecore:_/out kvpairs.result[].value

data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.maps.preload_initial_order
function slimecore:_/util/kvpairs/main
data modify storage slimecore:_ v.build.initial_orders.preload set value []
data modify storage slimecore:_ v.build.initial_orders.preload append from storage slimecore:_/out kvpairs.result[].value

# DEBUG:
tellraw @a ["INITIAL: ", {'storage':'slimecore:_', 'nbt':'v.build.initial_orders'}]
# evaluate final entrypoint orders:
#- check entrypoint order conflicts
#- check preload entrypoint order conflicts
# out : EntrypointReference<T>
data modify storage slimecore:_ v.build.entrypoint_order set value {in:{initial:[], befores:{}, error_key:""}, out:[]}
data modify storage slimecore:_ v.build.entrypoint_order.in.initial set from storage slimecore:_ v.build.initial_orders.normal
data modify storage slimecore:_ v.build.entrypoint_order.in.befores set from storage slimecore:_ v.build.maps.entrypoint_befores
data modify storage slimecore:_ v.build.entrypoint_order.in.error_key set value "entrypoint_order_conflicts"
function slimecore:_/impl/eval/build/entrypoint_order/do
data modify storage slimecore:_ v.build.final_order.entrypoints set from storage slimecore:_ v.build.entrypoint_order.out

tellraw @a ["FINAL: ", {'storage':'slimecore:_', 'nbt':'v.build.final_order'}]


data modify storage slimecore:_ v.build.entrypoint_order set value {in:{initial:[], befores:{}, error_key:""}, out:[]}
data modify storage slimecore:_ v.build.entrypoint_order.in.initial set from storage slimecore:_ v.build.initial_orders.preload
data modify storage slimecore:_ v.build.entrypoint_order.in.befores set from storage slimecore:_ v.build.maps.preload_befores
data modify storage slimecore:_ v.build.entrypoint_order.in.error_key set value "preload_entrypoint_order_conflicts"
function slimecore:_/impl/eval/build/entrypoint_order/do
data modify storage slimecore:_ v.build.final_order.preloads set from storage slimecore:_ v.build.entrypoint_order.out

# final error check:
execute if score *build.error _slimecore matches 1 run return 0

# : success if reached

# initial load order:
data modify storage slimecore:_/in kvpairs.map set from storage slimecore:_ v.build.maps.packs
function slimecore:_/util/kvpairs/main
data modify storage slimecore:_ v.build.loads set value []
data modify storage slimecore:_ v.build.loads append from storage slimecore:_/out kvpairs.result[].value

# evaluate final load order:
scoreboard players set *build.order_count _slimecore 0
data modify storage slimecore:_ v.build.final_order.loads set value []
execute if data storage slimecore:_ v.build.loads[0] run function slimecore:_/impl/eval/build/pass_load/each

# finalize data:
function slimecore:_/impl/eval/build/finalize/do

return 1