#> slimecore:_/impl/manifest/error/throw
#--------------------
# 
#--------------------

# {impl.manifest.throw}
# error: int
# data: any

# CODES:
# 1 - missing required data
# {fields: $field}
# 2 - invalid data
# {field: $field, expected: $expectation, got: any}
# 3 - duplicate deps/sups
# {instances[]: PackRequirement}
# 4 - duplicate implements
# {instances[]: PackProvision}
# 5 - implementations not found in deps/sups
# {instances[]: PackProvision}

return run data get storage slimecore:_ impl.manifest.throw.error -1