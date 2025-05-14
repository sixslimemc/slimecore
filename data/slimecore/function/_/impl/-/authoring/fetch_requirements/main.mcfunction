#> slimecore:_/impl/-/authoring/fetch_requirements/main
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:_ {v:{fetch_requirements:{list:[]}}}

tellraw @s {text:"------[ fetch_requirements ]------", color: light_purple, bold:true}
execute if data storage slimecore:_ v.fetch_requirements.in.packs[0] run function slimecore:_/impl/-/authoring/fetch_requirements/each

tellraw @s [{text:"->", color: black}, {storage:'slimecore:_', nbt:'v.fetch_requirements.list', color: aqua}, {text:"<-", color: black}]
tellraw @s {text:"----------------------------------", color: light_purple, bold:true}
tellraw @s {text:"[i] Copy this from console output and paste to manifest dependencies/supports.", color: gray, italic:true}
