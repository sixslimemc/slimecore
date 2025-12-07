#> slimecore:_/rebuild/old_links/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ var.rebuild.this_link set from storage slimecore:_ var.rebuild.old_links[-1]



data remove storage slimecore:_ var.rebuild.old_links[-1]
execute if data storage slimecore:_ var.rebuild.old_links[0] run function slimecore:_/rebuild/old_links/each