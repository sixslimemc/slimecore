#> slimecore:_/impl/-/packs/uninstall/unmark/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ impl.unmark.this_pack set from storage slimecore:_ impl.unmark.input.packs[-1]

function slimecore:_/impl/-/packs/uninstall/unmark/remove with storage slimecore:_ impl.unmark

data remove storage slimecore:_ impl.unmark.input.packs[-1]
execute if data storage slimecore:_ impl.unmark.input.packs[0] run function slimecore:_/impl/-/packs/uninstall/unmark/each
