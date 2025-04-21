#> slimecore:_/impl/-/packs/uninstall/mark/main
#--------------------
# $> packs[]: PackID
#--------------------
# TODO: description
#--------------------

data merge storage slimecore:in {safe_uninstalls:{uninstalls:[]}}
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
data modify storage slimecore:in safe_uninstalls.uninstalls