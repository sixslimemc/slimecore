#> slimecore : evaluate/partial/manifest/relative_order
#--------------------
# -> input: ManifestInputRelativeOrder
#--------------------
# <~ value? RelativeOrder
#--------------------
# TODO: description
#--------------------
# 1: success; >value< contains data.
# 0: error.
#--------------------
# MAIN

$data modify storage slimecore:out relative_order.value set from storage slimecore:_ validation.relative_order.map.'$(input)'