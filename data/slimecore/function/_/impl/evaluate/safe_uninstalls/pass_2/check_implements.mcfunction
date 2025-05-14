#> slimecore:_/impl/evaluate/safe_uninstalls/pass_2/check_implements
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ v.safe_uninstalls.implements set from storage slimecore:in safe_uninstalls.build.auxilary.pack_map.'$(pack)'.implements

data modify storage slimecore:_ util.intersection.in.a set from storage slimecore:_ v.safe_uninstalls.implements
data modify storage slimecore:_ util.intersection.in.b set from storage slimecore:_ v.safe_uninstalls.current_packs
data merge storage slimecore:_ {util:{intersection:{in:{compare:{only:['pack']}}}}}
function slimecore:_/util/six/array/intersection/main

data remove storage slimecore:_ v.safe_uninstalls.needed_impls
data modify storage slimecore:_ v.safe_uninstalls.needed_impls set from storage slimecore:_ util.intersection.out.shared

execute unless data storage slimecore:_ v.safe_uninstalls.needed_impls[] run return 1

# add unsafe entry:
data remove storage slimecore:_ v.safe_uninstalls.unsafe_entry
$data modify storage slimecore:_ v.safe_uninstalls.unsafe_entry set from storage slimecore:out safe_uninstalls.unsafe[{pack:'$(pack)'}]
$data remove storage slimecore:out safe_uninstalls.unsafe[{pack:'$(pack)'}]
data modify storage slimecore:_ v.safe_uninstalls.unsafe_entry.pack set from storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0].pack
data modify storage slimecore:_ v.safe_uninstalls.unsafe_entry.reason.implements set from storage slimecore:_ v.safe_uninstalls.needed_impls
data modify storage slimecore:out safe_uninstalls.unsafe append from storage slimecore:_ v.safe_uninstalls.unsafe_entry

scoreboard players set *safe_uninstalls.unsafe _slimecore 1
return fail