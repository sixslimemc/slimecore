#> slimecore:_/impl/evaluate/manifest/validate/composite/pack_provision
#--------------------
# ../each/implement.1
#--------------------

# pack:
data modify storage slimecore:_ impl.manifest.validate.pack set from storage slimecore:_ impl.manifest.validate.pack_provision.pack
execute unless data storage slimecore:_ impl.manifest.validate.pack_provision.pack run data modify storage slimecore:_ impl.manifest.validate.pack set from storage slimecore:_ impl.manifest.validate.pack_provision
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/pack with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path) (or $(root_path).pack)', expected:'valid datapack namespace'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.pack
