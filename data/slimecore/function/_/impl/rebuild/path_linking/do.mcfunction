# IMPL > slimecore:rebuild
# path_linking/do
#--------------------
# ../process
#--------------------

scoreboard players set *rebuild.unsafe _slimecore 0

data modify storage slimecore:_ v.rebuild.packs set from storage slimecore:_ v.rebuild.build.packs
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/path_linking/packs/each

execute if score *rebuild.unsafe _slimecore matches 1 run function slimecore:_/impl/rebuild/path_linking/is_unsafe