#> slimecore:_/impl/evaluate/manifest/validate/do
#--------------------
# ../main
#--------------------
# could be made "clean" with a reused function but I don't mind copy-paste for this.
# it's better for perfomance or something.

# at the end of this function {impl.manifest.throw.data.instances} will contain all instances of invalid data
# it will not exist if all data is valid
data remove storage slimecore:_ impl.manifest.throw

# pack:
scoreboard players set *manifest.validate.allow_self _slimecore 1
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/pack with storage slimecore:_ impl.manifest.in
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'pack', expected:"valid datapack namespace"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.pack

# version:
data modify storage slimecore:_ impl.manifest.validate.nonneg_number set from storage slimecore:_ impl.manifest.in.version.major
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/nonneg_number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.major', expected:"non-negative integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.major

data modify storage slimecore:_ impl.manifest.validate.nonneg_number set from storage slimecore:_ impl.manifest.in.version.minor
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/nonneg_number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.minor', expected:"non-negative integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.minor

data modify storage slimecore:_ impl.manifest.validate.nonneg_number set from storage slimecore:_ impl.manifest.in.version.patch
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/nonneg_number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.patch', expected:"non-negative integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.patch

# abstract:
data modify storage slimecore:_ impl.manifest.validate.bool set from storage slimecore:_ impl.manifest.in.abstract
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/bool
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'abstract', expected:"boolean"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.abstract

# dependencies:
data modify storage slimecore:_ impl.manifest.validate.array set from storage slimecore:_ impl.manifest.in.dependencies
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/array
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'dependencies', expected:"list"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.dependencies

scoreboard players set *i _slimecore 0
data modify storage slimecore:_ impl.manifest.validate.each.dependencies set from storage slimecore:_ impl.manifest.in.dependencies
execute if data storage slimecore:_ impl.manifest.validate.each.dependencies[0] run function slimecore:_/impl/evaluate/manifest/validate/each/dependency

# supports:
data modify storage slimecore:_ impl.manifest.validate.array set from storage slimecore:_ impl.manifest.in.supports
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/array
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'supports', expected:"list"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.supports

scoreboard players set *i _slimecore 0
data modify storage slimecore:_ impl.manifest.validate.each.supports set from storage slimecore:_ impl.manifest.in.supports
execute if data storage slimecore:_ impl.manifest.validate.each.supports[0] run function slimecore:_/impl/evaluate/manifest/validate/each/support

# implements:
data modify storage slimecore:_ impl.manifest.validate.array set from storage slimecore:_ impl.manifest.in.implements
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/array
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'implements', expected:"list"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.implements

scoreboard players set *i _slimecore 0
data modify storage slimecore:_ impl.manifest.validate.each.implements set from storage slimecore:_ impl.manifest.in.implements
execute if data storage slimecore:_ impl.manifest.validate.each.implements[0] run function slimecore:_/impl/evaluate/manifest/validate/each/implement

# finalize:
execute if data storage slimecore:_ impl.manifest.throw.data run data merge storage slimecore:_ {impl:{manifest:{throw:{error:2}}}}
execute if data storage slimecore:_ impl.manifest.throw.error run return run function slimecore:_/impl/evaluate/manifest/error/throw

return 1