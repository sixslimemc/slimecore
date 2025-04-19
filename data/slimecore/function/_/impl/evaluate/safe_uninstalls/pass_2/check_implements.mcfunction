#> slimecore:_/impl/evaluate/safe_uninstalls/pass_2/check_implements
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ impl.safe_uninstalls.implements set from storage slimecore:in safe_uninstalls.build.auxilary.pack_map.'$(this_un)'.implements

# LEFTOFF:
# check for implements using util intersection