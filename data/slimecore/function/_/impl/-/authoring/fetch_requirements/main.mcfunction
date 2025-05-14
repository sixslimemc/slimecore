#> slimecore:_/impl/-/authoring/fetch_requirements/main
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:_ {impl:{fetch_requirements:{list:[]}}}

tellraw @s {text:"------[ fetch_requirements ]------", color: blue}
execute if data storage slimecore:_ v.fetch_requirements.input.packs[0] run function slimecore:_/impl/-/authoring/fetch_requirements/each

tellraw @s {storage:'slimecore:_', nbt:'impl.fetch_requirements.list', color: gray, italic:true}
tellraw @s {text:"-----------------------------", color: blue, italic:false}