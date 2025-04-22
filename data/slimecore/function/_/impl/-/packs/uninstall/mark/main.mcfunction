#> slimecore:_/impl/-/packs/uninstall/mark/main
#--------------------
# $> packs[]: PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:in {safe_uninstalls:{uninstalls:[]}}
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
data modify storage slimecore:in safe_uninstalls.uninstalls append from storage slimecore:data uninstall.safe[].pack
data modify storage slimecore:in safe_uninstalls.uninstalls append from storage slimecore:data uninstall.unsafe[].pack
data modify storage slimecore:in safe_uninstalls.uninstalls append from storage slimecore:_ impl.mark.input.packs[]
function slimecore:evaluate/safe_uninstalls

data modify storage slimecore:data uninstall.safe set from storage slimecore:out safe_uninstalls.safe
data modify storage slimecore:data uninstall.unsafe set from storage slimecore:out safe_uninstalls.unsafe

# DEBUG:
tellraw @a ["Safe: ", {'storage':'slimecore:data', 'nbt':'uninstall.safe'}]
tellraw @a ["Unsafe: ", {'storage':'slimecore:data', 'nbt':'uninstall.unsafe'}]