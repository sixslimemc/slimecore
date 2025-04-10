#> slimecore:_/build/first_pass/impls/seen
#--------------------
# ./check_seen
#--------------------

execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.seen_entry set value {pack:'', sources:[]}
execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.seen_entry.pack set from storage slimecore:_ var.build.this_impl.pack
execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.seen_entry.sources append from storage slimecore:_ var.build.seen_source

data modify storage slimecore:_ var.build.seen_entry.sources append from storage slimecore:_ var.build.this_man

execute unless score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.error.multiple_implementations append from storage slimecore:_ var.build.seen_entry
$execute if score *build.has_error_entry _slimecore matches 1 run data modify storage slimecore:_ var.build.error.multiple_implementations[{pack:'$(pack)'}] set from storage slimecore:_ var.build.seen_entry