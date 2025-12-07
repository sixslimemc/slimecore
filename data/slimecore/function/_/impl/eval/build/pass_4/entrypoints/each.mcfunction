# IMPL > slimecore:eval/build
# pass_4/entrypoints/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoints[-1]

# populate initial order map:
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.maps.'", 2:true, 3:"'.'", 4:true, 5:";", 6:true, 7:"' set from storage slimecore:_ x.mline.entry"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.map_initial_order
data modify storage slimecore:_ x.mline.4 set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline.6 set from storage slimecore:_ v.build.this_entrypoint.id
data modify storage slimecore:_ x.mline.entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline.entry.id set from storage slimecore:_ v.build.this_entrypoint.id
function slimecore:_/util/mline/7 with storage slimecore:_ x.mline

execute unless data storage slimecore:_ v.build.this_entrypoint.before[0] run data modify storage slimecore:_ v.build.this_entrypoint.before set value []
execute unless data storage slimecore:_ v.build.this_entrypoint.after[0] run data modify storage slimecore:_ v.build.this_entrypoint.after set value []

data modify storage slimecore:_ v.build.evalin append value {id:"", pack_ref:""}
data modify storage slimecore:_ v.build.evalin[-1].id set from storage slimecore:_ v.build.this_entrypoint.id
data modify storage slimecore:_ v.build.evalin[-1].pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
function slimecore:_/impl/eval/build/pass_4/entrypoints/eval

data remove storage slimecore:_ v.build.entrypoints[-1]
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/each