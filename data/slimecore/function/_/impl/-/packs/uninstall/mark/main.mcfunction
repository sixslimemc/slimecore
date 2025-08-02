#> slimecore:_/impl/-/packs/uninstall/mark/main
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:in {safe_uninstalls:{uninstalls:[]}}

execute if data storage slimecore:_ v.mark.in.packs[0] run function slimecore:_/impl/-/packs/uninstall/mark/each

data modify storage slimecore:in safe_uninstalls.uninstalls set from storage slimecore:data uninstall_marked
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
function slimecore:evaluate/relation/safe_uninstalls

# DEBUG:
execute if data storage slimecore:out safe_uninstalls.not_in_build[0] run tellraw @a [{text:"Not in build: ", color: dark_gray}, {'storage':'slimecore:out', 'nbt':'safe_uninstalls.not_in_build', color: gray}]
execute if data storage slimecore:out safe_uninstalls.safe[0] run tellraw @a [{text:"Safe: ", color: dark_green}, {'storage':'slimecore:out', 'nbt':'safe_uninstalls.safe', color: green}]
execute if data storage slimecore:out safe_uninstalls.unsafe[0] run tellraw @a [{text:"Unsafe: ", color:dark_red}, {'storage':'slimecore:out', 'nbt':'safe_uninstalls.unsafe', color: red}]
