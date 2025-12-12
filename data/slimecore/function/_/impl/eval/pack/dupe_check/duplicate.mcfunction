# IMPL > slimecore:eval/pack
# dupe_check/duplicate
#--------------------
# ./each.1
#--------------------

scoreboard players set *pack.error _slimecore 1

$data modify storage slimecore:_ x.entry set value {in:"", id:'$(id)'}
data modify storage slimecore:_ x.entry.in set from storage slimecore:_ v.pack.key
data modify storage slimecore:out pack.result.error.duplicate_ids append from storage slimecore:_ x.entry