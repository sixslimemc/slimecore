#> slimecore:_/load/entrypoints/call
#--------------------
# ./each
#--------------------

# DEBUG
$tellraw @a {text:"- call: '#$(pack_ref):$(tag_key)/$(id)'", color:"gray"}
$function #$(pack_ref):$(tag_key)/$(id)