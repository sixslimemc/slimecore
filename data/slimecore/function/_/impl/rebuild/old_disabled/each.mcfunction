# IMPL > slimecore:rebuild
# in_disabled/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_disable set from storage slimecore:_ v.rebuild.old_disabled[-1]

data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ v.rebuild.this_disable
execute store result score *rebuild.found_path _slimecore run function slimecore:_/util/get_linked_path/main
data modify storage slimecore:_ v.rebuild.linked_out set from storage slimecore:_/out get_linked_path

# technically not needed but good to be explicit:
execute if score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/old_disabled/enable with storage slimecore:_ v.rebuild.linked_out

execute unless score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/old_disabled/missing

execute if score *rebuild.inherit_disables _slimecore matches 1 run function slimecore:_/impl/rebuild/old_disabled/inherit

data remove storage slimecore:_ v.rebuild.old_disabled[-1]
execute if data storage slimecore:_ v.rebuild.old_disabled[0] run function slimecore:_/impl/rebuild/old_disabled/each