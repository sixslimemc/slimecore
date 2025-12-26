#> slimecore:_/load/loads/call
#--------------------
# ./each
#--------------------

# HOOK: meta_info/call/load
$data modify storage slimecore:hook load set value {pack_ref:"$(pack_ref)"}
function #slimecore:hook/meta_info/call/load

$function #$(pack_ref):load