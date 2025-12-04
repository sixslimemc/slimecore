# IMPL > slimecore:eval/build
# pass_2/deps/unfulfilled

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.unfulfilled_dependencies[0] run data modify storage slimecore:out build.result.error.unfulfilled_dependencies set value []

# *build.dep_error
# 1 - missing pack id
# 2 - wrong author
# 3 - bad version; {..version_error} is set

data modify storage slimecore:_ x.entry set value {reason:{}, from:"", dependency:{}}
data modify storage slimecore:_ x.entry.from set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.entry.dependency set from storage slimecore:_ v.build.this_dep

execute if score *build.dep_error _slimecore matches 1 run data modify storage slimecore:_ x.entry.reason.not_present set from storage slimecore:_ v.build.this_dep.pack_id
execute if score *build.dep_error _slimecore matches 2 run data modify storage slimecore:_ x.entry.reason.author_mismatch.expected set from storage slimecore:_ v.build.this_dep.author_id
execute if score *build.dep_error _slimecore matches 2 run data modify storage slimecore:_ x.entry.reason.author_mismatch.got set from storage slimecore:_ v.build.dep_pack.author_id
execute if score *build.dep_error _slimecore matches 3 run data modify storage slimecore:_ x.entry.reason.incompatible_version set from storage slimecore:_ v.build.version_error

data modify storage slimecore:out build.result.error.unfulfilled_dependencies append from storage slimecore:_ x.entry