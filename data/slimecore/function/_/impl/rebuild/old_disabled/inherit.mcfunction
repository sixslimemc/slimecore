# IMPL > slimecore:rebuild
# in_disabled/inherit
#--------------------
# ./each
#--------------------

data modify storage slimecore:in rebuild.disable append value {pack_ref:""}
data modify storage slimecore:in rebuild.disable[-1].pack_ref set from storage slimecore:_ v.rebuild.this_disable.pack_id