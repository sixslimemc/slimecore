#> slimecore : evaluate/build
#--------------------
# -> packs[]: PackInfo
#--------------------
# <- result? {order: LoadSpec<[]{pack: PackID}> pack_map: {(PackID...): PackInfo}}
# <- error? {
#- duplicates[]? {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]? {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]? {root: PackInfo, cycle[]: PackID}
#- order_conflicts? LoadSpec<[]{a: PackID, b: PackID}>
#- missing_dependencies[]? {dependency: PackRequirement, dependent: PackInfo, bad_version? {installed: PackInfo, version_index: 0b | 1b}}
#- missing_implementations[]? {manifest: PackInfo}
# }
#--------------------
# TODO: description
#--------------------
# 1: valid build; >result< contains data.
# 0: invalid build; >error< contains data.
#--------------------

# wrapper around '_/build/main':
data modify storage slimecore:_ build.in.manifests set from storage slimecore:in build.packs
execute store result score *x _slimecore run function slimecore:_/build/main
data modify storage slimecore:out build.result set from storage slimecore:_ build.out.result
data modify storage slimecore:out build.error set from storage slimecore:_ build.out.error

data remove storage slimecore:in build

return run scoreboard players get *x _slimecore