# IMPL > slimecore : evaluate/pack_manifest
# references/each
#--------------------
# ../main
#--------------------

scoreboard players remove *pack_manifest.i _slimecore 1

# evaluate:
data modify storage slimecore:in pack_reference.input set from storage slimecore:_ v.pack_manifest.references[-1]
execute store result score *pack_manifest.ref_valid _slimecore run function slimecore:evaluate/component/pack_reference

# success:
execute if score *pack_manifest.ref_valid _slimecore matches 1 run function slimecore:_/impl/evaluate/pack_manifest/references/success

# error:
execute if score *pack_manifest.ref_valid _slimecore matches 0 run function slimecore:_/impl/evaluate/pack_manifest/references/error

scoreboard players reset *pack_manifest.ref_valid _slimecore

data remove storage slimecore:_ v.pack_manifest.references[-1]
execute if data storage slimecore:_ v.pack_manifest.references[0] run function slimecore:_/impl/evaluate/pack_manifest/references/each