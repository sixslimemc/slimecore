#> slimecore :_/util/ set_gamerules
#--------------------
# .
#--------------------
# .
#--------------------
# uses and sets {_ -> data.gamerule_cache}
#--------------------
# 1.
#--------------------

# DEV: technically this will permanently set gamerules to build time gamerules if 2 rebuilds are initiated on subsequent or same ticks.

function slimecore:_/util/set_gamerules/do with storage slimecore:_ data.gamerule_cache

return 1