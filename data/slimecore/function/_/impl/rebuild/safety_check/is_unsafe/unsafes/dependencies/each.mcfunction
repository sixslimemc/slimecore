# IMPL > slimecore:rebuild
# safety_check/is_unsafe/unsafes/dependencies/each
#--------------------
# ../each.1
#--------------------

# add to iterator:
data modify storage slimecore:_ v.rebuild.unsafes prepend value {pack_id:""}
data modify storage slimecore:_ v.rebuild.unsafes[0].pack_id set from storage slimecore:_ v.rebuild.build_manifest.dependencies[-1].pack_id

data remove storage slimecore:_ v.rebuild.build_manifest.dependencies[-1]
execute if data storage slimecore:_ v.rebuild.build_manifest.dependencies[0] run function slimecore:_/impl/rebuild/safety_check/is_unsafe/unsafes/dependencies/each