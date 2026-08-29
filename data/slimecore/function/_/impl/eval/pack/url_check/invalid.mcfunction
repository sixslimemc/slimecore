# IMPL > slimecore:eval/pack
# url_check/invalid
#--------------------
# ./check
#--------------------

scoreboard players set *pack.error _slimecore 1

data modify storage slimecore:_ x.entry set value {key:""}
data modify storage slimecore:_ x.entry.key set from storage slimecore:_ v.pack.this_path
data modify storage slimecore:out pack.result.error.invalid_urls append from storage slimecore:_ x.entry