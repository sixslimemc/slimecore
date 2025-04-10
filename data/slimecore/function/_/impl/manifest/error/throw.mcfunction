#> slimecore:_/impl/manifest/error/throw
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
# {instances[]: PackProvision}
# 5 - implementations not found in deps/sups
# {instances[]: PackProvision}

# TODO: implement this

return run data get storage slimecore:_ impl.manifest.throw.error -1