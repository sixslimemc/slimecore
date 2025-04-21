#> slimecore:_/impl/-/packs/uninstall/unmark/remove
#--------------------
# ./each
#--------------------

$data remove storage slimecore:data uninstall.marked[{pack:'$(this_pack)'}]
$data remove storage slimecore:data uninstall.unsafe[{pack:'$(this_pack)'}]