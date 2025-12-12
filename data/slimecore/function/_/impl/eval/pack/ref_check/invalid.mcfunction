# IMPL > slimecore:eval/pack
# ref_check/invalid

scoreboard players set *pack.error _slimecore 1

data modify storage slimecore:_ x.entry set value {}
data modify storage slimecore:_ x.entry.in set from storage slimecore:_ v.pack.key
data modify storage slimecore:_ x.entry.reference set from storage slimecore:_ v.pack.ref_check[-1]
execute store result score *x _slimecore if data storage slimecore:_ v.pack.ref_checks[]
scoreboard players remove *x _slimecore 1
execute store result storage slimecore:_ x.entry.index int 1 run scoreboard players get *x _slimecore
data modify storage slimecore:out pack.result.error.invalid_pack_references append from storage slimecore:_ x.entry