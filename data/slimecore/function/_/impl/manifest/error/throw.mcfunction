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
# 6 - not manifest time (*manifest_time != 1)
# (no data)

# TODO: implement

# DEBUG:
data modify storage test: out.manifest_throws append from storage slimecore:_ impl.manifest.throw
say MANIFEST THROW

return run data get storage slimecore:_ impl.manifest.throw.error -1