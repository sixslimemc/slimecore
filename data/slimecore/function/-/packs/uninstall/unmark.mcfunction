#> slimecore :-/ packs/uninstall
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

# unmarks <packs> for uninstallation.

$data merge storage slimecore:_ {v:{unmark:{in:{packs:$(packs)}}}}

function slimecore:_/impl/-/packs/uninstall/unmark/main

data remove storage slimecore:_ v.unmark