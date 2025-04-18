#> slimecore :-/ packs/uninstall
#--------------------
# $> packs[]: PackID
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

# TODO: implement