#> slimecore:_/impl/-/packs/uninstall/mark/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ v.mark.this_entry.pack set from storage slimecore:_ v.mark.in.packs[0]

function slimecore:_/impl/-/packs/uninstall/mark/remove_mark with storage slimecore:_ v.mark.this_entry
data modify storage slimecore:data uninstall_marked append from storage slimecore:_ v.mark.this_entry

data remove storage slimecore:_ v.mark.in.packs[0]
execute if data storage slimecore:_ v.mark.in.packs[0] run function slimecore:_/impl/-/packs/uninstall/mark/each