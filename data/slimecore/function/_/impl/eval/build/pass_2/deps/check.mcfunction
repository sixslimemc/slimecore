# IMPL > slimecore:eval/build
# pass_2/deps/check

# optional and not present:
execute if data storage slimecore:_ v.build.this_dep{optional:true} unless data storage slimecore:_ v.build.dep_pack run return 0

# not present:
execute unless data storage slimecore:_ v.build.dep_pack run return 1

data modify storage slimecore:_ x.author set from storage slimecore:_ v.build.this_dep.author_id
execute store success score *x _slimecore run data modify storage slimecore:_ x.author set from storage slimecore:_ v.build.dep_pack.author_id
execute if score *x _slimecore matches 1 run return 2

data modify storage slimecore:in version_req.version set from storage slimecore:_ v.build.dep_pack.version
data modify storage slimecore:in version_req.requirement set from storage slimecore:_ v.build.this_dep.version

execute store result score *x _slimecore run function slimecore:eval/version_req
data modify storage slimecore:_ v.build.version_error set from storage slimecore:out version_req.result.error
execute unless score *x _slimecore matches 1.. run return 3

return 0