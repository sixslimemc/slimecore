# IMPL > slimecore : evaluate/pack_manifest
# requirements/each
#--------------------
# ../main
#--------------------

scoreboard players remove *pack_manifest.i _slimecore 1

# eval:
data modify storage slimecore:in pack_requirement.input set from storage slimecore:_ v.pack_manifest.requirements[-1]
execute store result score *x _slimecore run function slimecore:evaluate/component/pack_requirement

# success:
execute if score *x _slimecore matches 1 run function slimecore:_/impl/evaluate/pack_manifest/requirements/success

# error:
execute if score *x _slimecore matches 0 run function slimecore:_/impl/evaluate/pack_manifest/requirements/error

data remove storage slimecore:_ v.pack_manifest.requirements[-1]
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each