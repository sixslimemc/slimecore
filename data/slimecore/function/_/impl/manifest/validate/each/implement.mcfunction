#> slimecore:_/impl/manifest/validate/each/implement
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ impl.manifest.validate.pack_requirement set from storage slimecore:_ impl.manifest.validate.each.implements[-1]

execute store result storage slimecore:_ impl.manifest.macro.i int 1 run scoreboard players get *i _slimecore
function slimecore:_/impl/manifest/validate/each/implement.1 with storage slimecore:_ impl.manifest.macro

scoreboard players add *i _slimecore 1
data remove storage slimecore:_ impl.mainfest.validate.each.implements[-1]
execute if data storage slimecore:_ impl.mainfest.validate.each.implements[0] run function slimecore:_/impl/manifest/validate/each/implement