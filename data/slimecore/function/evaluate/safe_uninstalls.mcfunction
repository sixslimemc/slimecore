#> slimecore : evaluate/safe_uninstalls
#--------------------
# -> build: Build
# -> uninstalling[]: PackID
#--------------------
# & UnsafeUninstallReason := {
#- dependency_of[]? PackReference
#- implements[]? PackReference
# }
# <- safe[]: PackID
# <- unsafe[]: {pack: PackID, reason: &UnsafeUninstallReason}
# <- not_in_build[]: PackID
#--------------------
# TODO: description
#--------------------
# 1: all <uninstalling> are safe to uninstall or are not in <build>.
# 0: there exist packs in <uninstalling> that are unsafe to uninstall given <build>.
#--------------------

data remove storage slimecore:out safe_uninstalls

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/safe_uninstalls/main

data remove storage slimecore:_ impl.safe_uninstalls
data remove storage slimecore:in safe_uninstalls

return run scoreboard players get *x _slimecore