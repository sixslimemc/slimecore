# IMPL > slimecore:-/uninstall_slimecore
# confirm
#--------------------
# ./main
# [chat] ./main
#--------------------

# get slimecore path:
data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:data slimecore
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/main
execute if score *x _slimecore matches 0 run return run function slimecore:_/impl/-/uninstall_slimecore/invalid_slimecore_path
data modify storage slimecore:_ t.uninstall.slimecore_path set from storage slimecore:_/out get_linked_path.path

function slimecore:_/impl/-/uninstall_slimecore/confirm.1 with storage slimecore:_ t.uninstall
