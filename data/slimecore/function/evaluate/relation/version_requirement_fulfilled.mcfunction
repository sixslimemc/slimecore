#> slimecore : evaluate/relation/version_requirement_fulfilled
#--------------------
# -> requirement: VersionRequirement
# -> version: Version
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# 1: <version> fulfills <requirement>
# 0: <version> does not fulfill <requirement>
#--------------------

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/relation/version_requirement_fulfilled/main

data remove storage slimecore:in version_requirement_fulfilled

return run scoreboard players get *x _slimecore