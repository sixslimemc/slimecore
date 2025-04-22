#> slimecore:_/impl/evaluate/manifest/error/throw
#--------------------
# 
#--------------------

# {impl.manifest.throw}
# error: int
# data: any

# CODES:
# 1 - missing required data
# {instances[]: {field: $field}}
# 2 - invalid data
# {instances[]: {field: $field, expected: $expectation, got: any}}
# 3 - duplicate deps/sups
# {instances[]: PackRequirement}
# 4 - duplicate implements
# {instances[]: PackReference}
# 5 - implementations not found in deps/sups
# {instances[]: PackReference}

execute store result score *x _slimecore run data get storage slimecore:_ impl.manifest.throw.error

execute if score *x _slimecore matches 1 run data modify storage slimecore:out manifest.error.missing_data set from storage slimecore:_ impl.manifest.throw.data.instances
execute if score *x _slimecore matches 2 run data modify storage slimecore:out manifest.error.invalid_data set from storage slimecore:_ impl.manifest.throw.data.instances
execute if score *x _slimecore matches 3 run data modify storage slimecore:out manifest.error.duplicate_dependencies set from storage slimecore:_ impl.manifest.throw.data.instances
execute if score *x _slimecore matches 4 run data modify storage slimecore:out manifest.error.duplicate_implements set from storage slimecore:_ impl.manifest.throw.data.instances
execute if score *x _slimecore matches 5 run data modify storage slimecore:out manifest.error.unspecified_implements set from storage slimecore:_ impl.manifest.throw.data.instances

return fail