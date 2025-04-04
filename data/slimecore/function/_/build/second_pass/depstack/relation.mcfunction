# slimecore:_/build/second_pass/depstack/relation
#--------------------
# ./each
#--------------------

execute store result score *build.depstacksize _slimecore if data storage slimecore:_ build.depstack[]

data merge storage slimecore:_ {build:{rel:{template:{load:[], pre_load:[], post_load:[]}}}}

$data modify storage slimecore:_ build.rel.dep set from storage slimecore:_ build.pmap.relations.'$(dep)'
$data modify storage slimecore:_ build.rel.parent set from storage slimecore:_ build.pmap.relations.'$(parent)'

execute unless data storage slimecore:_ build.rel.dep run data modify storage slimecore:_ build.rel.dep set from storage slimecore:_ build.rel.template
execute unless data storage slimecore:_ build.rel.parent run data modify storage slimecore:_ build.rel.parent set from storage slimecore:_ build.rel.template



# from A: if A < B, 