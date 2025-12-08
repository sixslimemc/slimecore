# IMPL > slimecore:rebuild
# get_override
#--------------------
# 
#--------------------

# macro args:
# $pack_id: PackId

# uses config
# returns {..override_path}? if there exists an override

data remove storage slimecore:_ v.rebuild.override_path
$data modify storage slimecore:_ v.rebuild.override_path set from storage slimecore:config datapack_path_override_map.'$(pack_id)'