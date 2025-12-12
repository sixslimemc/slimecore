# IMPL > slimecore:eval/build
# pass_2/deps/unfulfilled

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.unimplemented_abstracts[0] run data modify storage slimecore:out build.result.error.unimplemented_abstracts set value []

data modify storage slimecore:_ x.entry set value {pack_ref:"", id:""}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.entry.id set from storage slimecore:_ v.build.this_abstract.id

data modify storage slimecore:out build.result.error.unimplemented_abstracts append from storage slimecore:_ x.entry