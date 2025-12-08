#> slimecore:_/rebuild/old_links/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ x.path set from storage slimecore:_ var.rebuild.old_links[-1].path
function slimecore:_/util/inline/disable_datapack with storage slimecore:_ x

data remove storage slimecore:_ var.rebuild.old_links[-1]
execute if data storage slimecore:_ var.rebuild.old_links[0] run function slimecore:_/rebuild/old_links/each