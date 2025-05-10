#> slimecore:_/impl/-/dev_utils/fetch_deplist/main
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:_ {impl:{fetch_deplist:{list:[]}}}

tellraw @s {text:"------[ FETCH_DEPLIST ]------", color: blue}
execute if data storage slimecore:_ impl.fetch_deplist.input.packs[0] run function slimecore:_/impl/-/dev_utils/fetch_deplist/each

tellraw @s {storage:'slimecore:_', nbt:'impl.fetch_deplist.list', color: gray, italic:true}
tellraw @s {text:"-----------------------------", color: blue, italic:false}