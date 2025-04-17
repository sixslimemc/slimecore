#> slimecore:_/build/pass_1/dupe_found
#--------------------
# ./each.1
#--------------------

scoreboard players set *build.error _slimecore 1

execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.dupe_entry set value {pack:'', instances:[]}
execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.dupe_entry.pack set from storage slimecore:_ var.build.this_man.pack
execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.dupe_entry.instances append from storage slimecore:_ var.build.dupe

data modify storage slimecore:_ var.build.dupe_entry.instances append from storage slimecore:_ var.build.this_man

execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.error.duplicate_packs append from storage slimecore:_ var.build.dupe_entry
$execute if score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.error.duplicate_packs[{pack:'$(pack)'}] set from storage slimecore:_ var.build.dupe_entry