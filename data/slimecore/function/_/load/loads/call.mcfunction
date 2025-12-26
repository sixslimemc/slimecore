#> slimecore:_/load/loads/call
#--------------------
# ./each
#--------------------

# HOOK: info/call/load
$data modify storage slimecore:hook load set value {pack_ref:"$(pack_ref)"}
function #slimecore:hook/info/call/load

$function #$(pack_ref):load