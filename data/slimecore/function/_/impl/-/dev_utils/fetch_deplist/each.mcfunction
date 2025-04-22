#> slimecore:_/impl/-/dev_utils/fetch_deplist/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ impl.fetch_deplist.this_pack set from storage slimecore:_ impl.fetch_deplist.input.packs[-1]

execute store success score *x _slimecore run function slimecore:_/impl/-/dev_utils/fetch_deplist/add_pack with storage slimecore:_ impl.fetch_deplist

# DEBUG:
execute unless score *x _slimecore matches 1 run tellraw @s [{text:"[!] ", color: red, bold:true}, {storage:'slimecore:_', nbt:'impl.fetch_deplist.this_pack', color: gold}, {text:" does not exist in the current build.", color: red}]

data remove storage slimecore:_ impl.fetch_deplist.input.packs[-1]
execute if data storage slimecore:_ impl.fetch_deplist.input.packs[0] run function slimecore:_/impl/-/dev_utils/fetch_deplist/each

