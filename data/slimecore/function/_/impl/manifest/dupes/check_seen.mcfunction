#> slimecore:_/impl/manifest/dupes/check_seen
#--------------------
# ./each
#--------------------

data merge storage slimecore:_ {impl:{manifest:{dupes:{dupe:[]}}}}
$data modify storage slimecore:_ impl.manifest.dupes.dupe append from storage slimecore:_ impl.manifest.dupes.seen[{pack:'$(pack)'}]
return run execute if data storage slimecore:_ impl.manifest.dupes.dupe[0]