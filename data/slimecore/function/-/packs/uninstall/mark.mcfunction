#> slimecore :-/ packs/uninstall
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

# marks <packs> for uninstallation.
# if a PACK cannot be uninstalled safely, warn the user why, and mark PACK as an "unsafe uninstall".
# if the user uninstalls packs that would make an unsafe uninstall safe, PACK, then mark PACK for uninstallation.
# on rebuild:
#- call all packs marked for uninstallation #uninstall tag
#- inform the user that all uninstalled packs should be removed from the world
#- warn the user once again why some packs cannot be safetly uninstalled (if any)
#- remove all safe/unsafe uninstall marks

# no packs can be uninstalled until ALL marks are safe and resolved.

$data merge storage slimecore:_ {impl:{mark:{input:{packs:$(packs)}}}}

function slimecore:_/impl/-/packs/uninstall/mark/main

data remove storage slimecore:_ impl.mark