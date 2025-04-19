#> slimecore:_/impl/-/packs/uninstall/mark/new/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ impl.mark.this_pack set from storage slimecore:_ impl.mark.input_packs[-1]

execute store success score *x _slimecore run function slimecore:_/impl/-/packs/uninstall/mark/new/check_seen with storage slimecore:_ impl.mark

execute if score *x _slimecore matches 0 run scoreboard players set *mark.has_new _slimecore 1
execute if score *x _slimecore matches 0 run data modify storage slimecore:_ impl.mark.eval append from storage slimecore:_ impl.mark.this_pack
execute if score *x _slimecore matches 0 run data modify storage slimecore:_ impl.mark.seen append from storage slimecore:_ impl.mark.this_pack

execute if score *x _slimecore matches 1 run function slimecore:_/impl/-/packs/uninstall/mark/new/warn_seen

data remove storage slimecore:_ impl.mark.input_packs[-1]
execute if data storage slimecore:_ impl.mark.input_packs[0] run function slimecore:_/impl/-/packs/uninstall/mark/new/each
