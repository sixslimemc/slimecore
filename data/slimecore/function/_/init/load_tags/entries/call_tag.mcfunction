#> slimecore:_/init/load_tags/entries/call_tag
#--------------------
# ./for_i
#--------------------

data remove storage slimecore:api this
$data modify storage slimecore:api this set from storage slimecore:_ var.init.load_data.'$(this_pack)'
$function #$(this_pack):$(this_tag)
