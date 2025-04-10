#> slimecore:_/impl/manifest/dupe_deps/check_seen
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ impl.manifest.dupes.dupe set from storage slimecore:_ impl.manifest.dupes.seen[{pack:'$(pack)'}]
scoreboard players set *x _slimecore 0
execute store result score *x _slimecore if data storage slimecore:_ impl.manifest.dupes.dupe[]
execute unless score *x _slimecore matches 1.. store success score *x _slimecore if data storage slimecore:_ impl.manifest.dupe.dupe

return run scoreboard players get *x _slimecore