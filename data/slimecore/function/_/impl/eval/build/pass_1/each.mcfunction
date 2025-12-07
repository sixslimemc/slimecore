# IMPL > slimecore:eval/build
# pass_1/each

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]

# DEBUG:
tellraw @a ["PACK: ", {'storage':'slimecore:_', 'nbt':'v.build.this_pack.pack_id'}]
# {..map.packs}
# and duplicate detection
function slimecore:_/impl/eval/build/pass_1/try_add with storage slimecore:_ v.build.this_pack

# {..map.impls}
data modify storage slimecore:_ v.build.impls set from storage slimecore:_ v.build.this_pack.abstract_implementations
execute if data storage slimecore:_ v.build.impls[0] run function slimecore:_/impl/eval/build/pass_1/impls/each

# {..maps.entrypoint_after_cache}
data modify storage slimecore:_ v.build.map_key set value "entrypoint_after_cache"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_1/entrypoints/each

# {..maps.preload_after_cache}
data modify storage slimecore:_ v.build.map_key set value "preload_after_cache"
data modify storage slimecore:_ v.build.entrypoints set from storage slimecore:_ v.build.this_pack.preload_entrypoints
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_1/entrypoints/each


data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
