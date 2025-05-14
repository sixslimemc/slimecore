#> slimecore:_/impl/-/authoring/fetch_requirements/each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ v.fetch_requirements.this_pack set from storage slimecore:_ v.fetch_requirements.in.packs[-1]

execute store success score *x _slimecore run function slimecore:_/impl/-/authoring/fetch_requirements/add_pack with storage slimecore:_ v.fetch_requirements

# DEBUG:
execute unless score *x _slimecore matches 1 run tellraw @s [{text:"[!] ", color: red, bold:true}, {storage:'slimecore:_', nbt:'v.fetch_requirements.this_pack', color: gold}, {text:" does not exist in the current build.", color: red}]

data remove storage slimecore:_ v.fetch_requirements.in.packs[-1]
execute if data storage slimecore:_ v.fetch_requirements.in.packs[0] run function slimecore:_/impl/-/authoring/fetch_requirements/each

