#> six:_/impl/array/set/intersection/add_match
#--------------------
# ./each_match
#--------------------

data modify storage slimecore:_ util.intersection.out.shared_a append from storage slimecore:_ util.intersection.var.a_item
data modify storage slimecore:_ util.intersection.out.shared_b append from storage slimecore:_ util.intersection.var.b_item
data modify storage slimecore:_ util.intersection.out.shared append from storage slimecore:_ util.intersection.var.a_compare