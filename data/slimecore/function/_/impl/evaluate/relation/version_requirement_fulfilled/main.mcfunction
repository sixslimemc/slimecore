# IMPL > slimecore : evaluate/relation/version_requirement_fulfilled
# main
#--------------------

# score storage:
execute store result score *x _slimecore run data get storage slimecore:in version_requirement_fulfilled.requirement.major
execute store result score *y _slimecore run data get storage slimecore:in version_requirement_fulfilled.requirement.minor

execute store result score *a _slimecore run data get storage slimecore:in version_requirement_fulfilled.version.major
execute store result score *b _slimecore run data get storage slimecore:in version_requirement_fulfilled.version.minor

# version comparison:
execute unless score *a _slimecore = *x _slimecore run return 0
execute if score *a _slimecore matches 0 unless score *y _slimecore = *b _slimecore run return 0
execute unless score *b _slimecore >= *y _slimecore run return 0

return 1