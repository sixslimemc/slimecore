#> slimecore:_/impl/evaluate/relation/safe_uninstalls/main
#--------------------
# -> build: Build
# -> uninstalls[]: PackReference
#--------------------
# & UnsafeUninstallReason := {
#- dependency_of[]? PackReference
#- implements[]? PackReference
# }
# <- safe[]: PackReference
# <- unsafe[]: {pack: $PackID, reason: &UnsafeUninstallReason}
# <- not_in_build[]: PackReference
#--------------------
# 1: all <uninstalling> are safe to uninstall or are not in <build>.
# 0: there exist packs in <uninstalling> that are unsafe to uninstall given <build>.
#--------------------

data merge storage slimecore:out {safe_uninstalls:{safe:[], unsafe:[], not_in_build:[]}}

data merge storage slimecore:_ {v:{safe_uninstalls:{valid_uninstalls:[]}}}
data modify storage slimecore:_ v.safe_uninstalls.current_packs set from storage slimecore:in safe_uninstalls.build.packs

# pass 1:
#- remove each uninstall from {..current_packs}
#- populate {..valid_uninstalls}
data modify storage slimecore:_ v.safe_uninstalls.uninstalls set from storage slimecore:in safe_uninstalls.uninstalls
execute if data storage slimecore:_ v.safe_uninstalls.uninstalls[0] run function slimecore:_/impl/evaluate/relation/safe_uninstalls/pass_1/each

# pass 2:
#- detect unsafe uninstalls
execute if data storage slimecore:_ v.safe_uninstalls.valid_uninstalls[0] run function slimecore:_/impl/evaluate/relation/safe_uninstalls/pass_2/each

execute if data storage slimecore:out safe_uninstalls.unsafe[0] run return 0

return 1