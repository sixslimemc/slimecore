# IMPL > slimecore:eval/build
# pass_2/ref_check/checks/invalid
#--------------------
# ./each
#--------------------

scoreboard players set *build.error _slimecore 1

# append if no error entry for this pack yet:
data modify storage slimecore:_ x.entry set value {pack:{}, invalid_references:[]}
execute unless data storage slimecore:_ v.build{has_err_entry:true} run data modify storage slimecore:out build.result.error.packs_with_invalid_references append from storage slimecore:_ x.entry
execute unless data storage slimecore:_ v.build{has_err_entry:true} run data modify storage slimecore:out build.result.error.packs_with_invalid_references[-1].pack set from storage slimecore:_ v.build.this_pack
data modify storage slimecore:_ v.build.has_err_entry set value true

# append invalid reference entry:
data modify storage slimecore:_ x.entry set value {key:"", type:0}
data modify storage slimecore:_ x.entry.type set from storage slimecore:_ v.build.ref_type
data modify storage slimecore:_/in keystring.parts set from storage slimecore:_ v.build.key_parts
function slimecore:_/util/keystring/main
data modify storage slimecore:_ x.entry.key set from storage slimecore:_/out keystring.result
data modify storage slimecore:out build.result.error.packs_with_invalid_references[-1].invalid_references append from storage slimecore:_ x.entry
