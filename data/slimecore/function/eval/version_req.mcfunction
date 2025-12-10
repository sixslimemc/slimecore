#> slimecore : eval/version_req
#--------------------
# -> version: Version
# -> requirement: VersionRequirement
#--------------------
# <- result: EvalResult<true, {
#   major_not_equal_to: PositiveInt,
#   minor_less_than: PositiveInt,
#   dev_minor_not_equal_to: PositiveInt,
# }
#--------------------
# TODO: description
#--------------------
# 1: success
# 0: error
#--------------------

data modify storage slimecore:out version_req set value {}

execute store result score *x _slimecore run function slimecore:_/impl/eval/version_req/main

data remove storage slimecore:_ v.version_req
data remove storage slimecore:in version_req

return run scoreboard players get *x _slimecore