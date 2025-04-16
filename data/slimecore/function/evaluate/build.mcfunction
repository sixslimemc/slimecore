#> slimecore : evaluate/build
#--------------------
# -> packs[]: PackInfo
#--------------------
# <~ value? {order: LoadSpec<[]{pack: PackID}> pack_map: {(PackID...): PackInfo}}
# <~ error? BuildEvaluationError
#--------------------
# TODO: description
#--------------------
# 1: valid build; >value< contains data.
# 0: invalid build; >error< contains data.
#--------------------

# wrapper around '_/build/main':
data modify storage slimecore:_ build.in.manifests set from storage slimecore:in build.packs
execute store result score *x _slimecore run function slimecore:_/build/main
data modify storage slimecore:out build.value set from storage slimecore:_ build.out.result
data modify storage slimecore:out build.error set from storage slimecore:_ build.out.error

data remove storage slimecore:in build

return run scoreboard players get *x _slimecore