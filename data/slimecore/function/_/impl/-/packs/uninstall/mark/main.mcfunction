#> slimecore:_/impl/-/packs/uninstall/mark/main
#--------------------
# $> packs[]: PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:_ {impl:{mark:{seen:[], eval:[]}}}
data modify storage slimecore:_ impl.mark.seen append from storage slimecore:data uninstall.marked[]
data modify storage slimecore:_ impl.mark.seen append from storage slimecore:data uninstall.unsafe[]
data modify storage slimecore:_ impl.mark.eval append from storage slimecore:data uninstall.unsafe[].pack

# add new packs to eval:
scoreboard players set *mark.has_new _slimecore 0
data modify storage slimecore:_ impl.mark.input_packs set from storage slimecore:_ impl.mark.in.packs
execute if data storage slimecore:_ impl.mark.input_packs[0] run function slimecore:_/impl/-/packs/uninstall/mark/new/each

# return if no new packs:
execute unless score *mark.has_new _slimecore matches 1 run return fail

# make {..current_packs} the current build's packs minus packs marked for uninstall:
data modify storage slimecore:_ impl.mark.current_packs set from storage slimecore:data current_build.packs


execute if data storage slimecore:_ impl.mark.eval[0] run function slimecore:_/impl/-/packs/uninstall/mark/main
