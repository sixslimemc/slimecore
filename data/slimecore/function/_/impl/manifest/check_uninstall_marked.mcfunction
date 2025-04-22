#> slimecore:_/impl/manifest/check_uninstall_marked
#--------------------
# ./main
#--------------------

# no packs can be marked for uninstall if any are unsafe:
execute if data storage slimecore:data uninstall.unsafe[0] run return fail

$execute if data storage slimecore:data uninstall.safe[{pack:'$(pack)'}] run return 1
return fail