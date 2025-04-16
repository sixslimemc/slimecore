#> slimecore:_/impl/evaluate/manifest/require/do
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

data merge storage slimecore:_ {impl:{manifest:{required:['pack', 'version.major', 'version.minor', 'version.patch', 'display_name', 'url', 'author.display_name']}}}
execute if data storage slimecore:_ impl.manifest.required[0] run function slimecore:_/impl/evaluate/manifest/require/each

execute if data storage slimecore:_ impl.manifest.throw.data run data merge storage slimecore:_ {impl:{manifest:{error:1}}}
execute if data storage slimecore:_ impl.manifest.throw.error run return run function slimecore:_/impl/evaluate/manifest/error/throw

return 1