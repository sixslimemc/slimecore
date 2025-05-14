#> slimecore:_/impl/-/packs/uninstall/unmark/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ v.unmark.this_pack set from storage slimecore:_ v.unmark.in.packs[-1]

function slimecore:_/impl/-/packs/uninstall/unmark/remove with storage slimecore:_ v.unmark

data remove storage slimecore:_ v.unmark.in.packs[-1]
execute if data storage slimecore:_ v.unmark.in.packs[0] run function slimecore:_/impl/-/packs/uninstall/unmark/each
