#> slimecore : rebuild
#--------------------
# -> disable?: [PackReference]
# -> uninstall?: [PackReference]
# -> force_clean?: boolean
#--------------------
# .
#--------------------
# TODO: description
# - calls hook 'rebuild_result' when done.
#--------------------
# 1.
#--------------------

data remove storage slimecore:out rebuild

execute unless data storage slimecore:in rebuild.disable run data modify storage slimecore:in rebuild.disable set value []
execute unless data storage slimecore:in rebuild.uninstall run data modify storage slimecore:in rebuild.uninstall set value []
execute unless data storage slimecore:in rebuild.force_clean run data modify storage slimecore:in rebuild.force_clean set value false

function slimecore:_/impl/rebuild/main

data remove storage slimecore:in rebuild

return 1