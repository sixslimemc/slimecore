# IMPL > slimecore:eval/version_req
# main

execute store result score *x _slimecore run data get storage slimecore:in version_req.version.major
execute store result score *y _slimecore run data get storage slimecore:in version_req.version.minor
execute store result score *a _slimecore run data get storage slimecore:in version_req.requirement.major
execute store result score *b _slimecore run data get storage slimecore:in version_req.requirement.minor

execute unless score *x _slimecore = *a _slimecore store result storage slimecore:out version_req.result.error.major_not_equal_to int 1 run scoreboard players get *a _slimecore
execute if data storage slimecore:out version_req.result.error run return 0

execute if score *a _slimecore matches 0 unless score *y _slimecore = *b _slimecore store result storage slimecore:out version_req.result.error.dev_minor_not_equal_to int 1 run scoreboard players get *b _slimecore
execute if data storage slimecore:out version_req.result.error run return 0

execute if score *y _slimecore < *b _slimecore store result storage slimecore:out version_req.result.error.minor_less_than int 1 run scoreboard players get *b _slimecore
execute if data storage slimecore:out version_req.result.error run return 0

return 1