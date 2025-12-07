# IMPL > slimecore:eval/build
# pass_3/eval

$execute store success score *x _slimecore run data modify storage slimecore:_ v.build.eval_seen.'$(pack_ref)' set value true
execute if score *x _slimecore matches 0 run return 0

$data modify storage slimecore:_ v.build.this_dep set value {pack_ref:'$(pack_ref)'}

$execute if data storage slimecore:_ v.build.depstack[{pack_ref:'$(pack_ref)'}] run return run function slimecore:_/impl/eval/build/pass_3/cycle_found

# DEBUG:
tellraw @a ["STACK: ", {'storage':'slimecore:_', 'nbt':'v.build.depstack'}]
tellraw @a ["THIS: ", {'storage':'slimecore:_', 'nbt':'v.build.this_dep'}]

# must continue through full function from here onward

data modify storage slimecore:_ v.build.evalstack append value {iter:[]}
data modify storage slimecore:_ v.build.depstack append from storage slimecore:_ v.build.this_dep

$data modify storage slimecore:_ v.build.evalstack[-1].iter set from storage slimecore:_ v.build.maps.packs.'$(pack_ref)'.dependencies
execute if data storage slimecore:_ v.build.evalstack[-1].iter[0] run function slimecore:_/impl/eval/build/pass_3/deps/each

data remove storage slimecore:_ v.build.depstack[-1]
data remove storage slimecore:_ v.build.evalstack[-1]