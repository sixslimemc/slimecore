#> slimecore:_/load/loads/call
#--------------------
# ./each
#--------------------

# HOOK: call/pre/load
$data modify storage slimecore:hook load set value {pack_id:"$(pack_ref)"}
function #slimecore:hook/call/pre/load
data remove storage slimecore:hook load

$function #$(pack_ref):load

# HOOK: call/post/load
$data modify storage slimecore:hook load set value {pack_id:"$(pack_ref)"}
function #slimecore:hook/call/post/load
data remove storage slimecore:hook load
