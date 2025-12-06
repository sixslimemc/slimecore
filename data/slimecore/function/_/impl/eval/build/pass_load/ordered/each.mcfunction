# IMPL > slimecore:eval/build
# pass_load/ordered/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ x.mline set value {1:"return run execute if data storage slimecore:_ v.build.maps.load_afters.'", 2:true, 3:"'{'", 4:true, 5:"':true}"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline.4 set from storage slimecore:_ v.build.order[-1].pack_ref
execute store result score *x _slimecore run function slimecore:_/util/mline/5 with storage slimecore:_ x.mline
execute if score *x _slimecore matches 1 run return 0

scoreboard players remove *build.insert_index _slimecore 1
data remove storage slimecore:_ v.build.order[-1]
execute if data storage slimecore:_ v.build.order[0] run function slimecore:_/impl/eval/build/pass_load/ordered/each