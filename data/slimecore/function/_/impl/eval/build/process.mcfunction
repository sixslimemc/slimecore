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
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 2:
#- check dependencies fulfilled
#- check interfaces implemented
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 3:
#- check dependency cycles
data modify storage slimecore:_ v.build.eval_seen set value {}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_3/each
execute if score *build.error _slimecore matches 1 run return 0

# pass 4:
#- populate {..maps.entrypoint_befores}
#- populate {..maps.preload_befores}
#- populate {..maps.entrypoint_initial_order}
#- populate {..maps.preload_initial_order}
data modify storage slimecore:_ v.build.packs set from storage slimecore:_/in build.packs
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
execute if score *build.error _slimecore matches 1 run return 0

# get initial entrypoint orders (based off built-in string key ordering):
# out : EntrypointReference<T>
data modify storage slimecore:_ v.build.initial_order set value {in:{}, out:[]}
data modify storage slimecore:_ v.build.initial_order.in set from storage slimecore:_ v.build.maps.entrypoint_initial_order
function slimecore:_/impl/eval/build/initial_order/do
data modify storage slimecore:_ v.build.store.initial_entrypoint_order set from storage slimecore:_ v.build.initial_order.out

data modify storage slimecore:_ v.build.initial_order set value {in:{}, out:[]}
data modify storage slimecore:_ v.build.initial_order.in set from storage slimecore:_ v.build.maps.preload_initial_order
function slimecore:_/impl/eval/build/initial_order/do
data modify storage slimecore:_ v.build.store.initial_preload_order set from storage slimecore:_ v.build.initial_order.out

# evaluate actual entrypoint orders:
#- check entrypoint order cycles
#- check preload entrypoint order cycles
# out : EntrypointReference<T>
data modify storage slimecore:_ v.build.eval_order set value {in:{initial:[], befores:{}, error_key:""}, out:[]}
data modify storage slimecore:_ v.build.eval_order.in.initial set from storage slimecore:_ v.build.store.initial_entrypoint_order
data modify storage slimecore:_ v.build.eval_order.in.befores set from storage slimecore:_ v.build.maps.entrypoint_befores
data modify storage slimecore:_ v.build.eval_order.in.error_key set value "entrypoint_order_cycles"
function slimecore:_/impl/eval/build/initial_order/do
data modify storage slimecore:_ v.build.store.initial_preload_order set from storage slimecore:_ v.build.initial_order.out