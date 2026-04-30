# IMPL > slimecore:rebuild
# old_disabled/append_post
#--------------------
# ./each
#--------------------

data modify storage scdev:_ v.rebuild.post_disables append value {path:""}
data modify storage scdev:_ v.rebuild.post_disables[-1].path set from storage scdev:_ v.rebuild.linked_out.path