#> slimecore:_/impl/evaluate/manifest/validate/composite/pack_requirement
#--------------------
# ../each/dependency.1
# ../each/support.1
#--------------------

# pack:
data modify storage slimecore:_ impl.manifest.validate.pack set from storage slimecore:_ impl.manifest.validate.pack_requirement.pack
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/pack with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).pack', expected:'valid datapack namespace'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.pack

# version:
execute unless data storage slimecore:_ impl.manifest.validate.pack_requirement.version.major run data merge storage slimecore:_ {impl:{manifest:{validate:{pack_requirement:{version:{major:""}}}}}}
data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.major
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/number with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).version.major', expected:'integer'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.major

execute unless data storage slimecore:_ impl.manifest.validate.pack_requirement.version.minor run data merge storage slimecore:_ {impl:{manifest:{validate:{pack_requirement:{version:{minor:""}}}}}}
data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.minor
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/number with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).version.minor', expected:'integer'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.minor

# loads:
data modify storage slimecore:_ impl.manifest.validate.load_words set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ impl.manifest.validate.load_words[0] run function slimecore:_/impl/evaluate/manifest/validate/composite/loads/each
