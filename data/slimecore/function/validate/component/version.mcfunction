#> slimecore : validate/component/version
#--------------------
# -> value: Version | any
#--------------------
# <~ error? CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a valid Version.
# 0: <value> is not a valid Version; >error< contains data.
#--------------------

data remove storage slimecore:out version

execute store result score *x _slimecore run function slimecore:_/impl/validate/component/version/main
data remove storage slimecore:in version

return run scoreboard players get *x _slimecore