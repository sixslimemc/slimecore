#> slimecore:_/impl/-/packs/uninstall/mark/seen/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ impl.mark.this_marked set from storage slimecore:_ impl.mark.seen[-1]

function slimecore:_/impl/-/packs/uninstall/mark/seen/remove_pack with storage slimecore:_ impl.mark

data remove storage slimecore:_ impl.mark.seen[-1]
execute if data storage slimecore:_ impl.mark.seen[0] run function slimecore:_/impl/-/packs/uninstall/mark/seen/each