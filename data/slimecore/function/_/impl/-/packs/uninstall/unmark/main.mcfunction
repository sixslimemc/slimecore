#> slimecore:_/impl/-/packs/uninstall/unmark/main
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

execute if data storage slimecore:_ impl.unmark.input.packs[0] run function slimecore:_/impl/-/packs/uninstall/unmark/each

# re-evaluate uninstalls:
function slimecore:-/packs/uninstall/mark {packs:[]}
