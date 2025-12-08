# IMPL > slimecore:rebuild
# old_links/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.old_links[-1].path
function slimecore:_/util/inline/disable_datapack with storage slimecore:_ x

data remove storage slimecore:_ v.rebuild.old_links[-1]
execute if data storage slimecore:_ v.rebuild.old_links[0] run function slimecore:_/impl/rebuild/old_links/each