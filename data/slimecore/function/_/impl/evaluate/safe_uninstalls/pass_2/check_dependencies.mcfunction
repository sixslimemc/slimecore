#> slimecore:_/impl/evaluate/safe_uninstalls/pass_2/check_dependencies
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ util.to_packrefs.in.packs append from storage slimecore:_ impl.safe_uninstalls.current_packs[{dependencies:[{pack:'$(this_un)'}]}].pack
function slimecore:_/util/to_packrefs/main
data modify storage slimecore:_ impl.safe_uninstalls.dependents set from storage slimecore:_ util.to_packrefs.out.result

# early return if no dependents:
execute unless data storage slimecore:_ impl.safe_uninstalls.dependents[] run return 1

# add unsafe entry:
data remove storage slimecore:_ impl.safe_uninstalls.unsafe_entry
data modify storage slimecore:_ impl.safe_uninstalls.unsafe_entry.pack set from storage slimecore:_ impl.safe_uninstalls.this_un
data modify storage slimecore:_ impl.safe_uninstalls.unsafe_entry.reason.dependency_of set from storage slimecore:_ impl.safe_uninstalls.dependent
data modify storage slimecore:out safe_uninstalls.unsafe append from storage slimecore:_ impl.safe_uninstalls.unsafe_entry
