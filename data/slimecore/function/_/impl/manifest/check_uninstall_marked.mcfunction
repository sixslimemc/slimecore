#> slimecore:_/impl/manifest/check_uninstall_marked
#--------------------
# ./main
#--------------------

$execute if data storage slimecore:data uninstall.marked[{pack:'$(pack)'}] run return 1
return fail