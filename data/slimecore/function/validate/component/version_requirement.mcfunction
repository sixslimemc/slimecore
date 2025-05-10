#> slimecore : validate/component/version_requirement
#--------------------
# -> value: any
#--------------------
# <~ error? CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a valid VersionRequirement.
# 0: <value> is not a valid VersionRequirement; >error< contains data.
#--------------------

data remove storage slimecore:out version_requirement

execute store result score *x _slimecore run function slimecore:_/impl/validate/component/version_requirement/main

data remove storage slimecore:_ v.version_requirement
data remove storage slimecore:in version_requirement

return run scoreboard players get *x _slimecore