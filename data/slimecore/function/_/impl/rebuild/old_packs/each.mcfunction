# IMPL > slimecore:rebuild
# new_packs/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_pack set from storage slimecore:_ v.rebuild.packs[-1]

data modify storage slimecore:_ x.pack_id set from storage slimecore:_ v.rebuild.this_pack.pack_id
function slimecore:_/impl/rebuild/get_override with storage slimecore:_ x

data modify storage slimecore:_/in default_filepaths.pack_id set from storage slimecore:_ v.rebuild.this_pack.pack_id
data modify storage slimecore:_/in default_filepaths.version set from storage slimecore:_ v.rebuild.this_pack.version
function slimecore:_/util/default_filepaths/main
data modify storage slimecore:_ v.rebuild.default_paths set from storage slimecore:_/out default_filepaths.result

# shitty ass scoreboard if-checking.
# disable this pack:
scoreboard players set *x _slimecore 0
data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.path_override
execute if data storage slimecore:_ v.rebuild.path_override store success score *x _slimecore run function slimecore:_/util/inline/disable_datapack with storage slimecore:_ x
execute if data storage slimecore:_ v.rebuild.path_override if score *x _slimecore matches 0 run scoreboard players set *x _slimecore 2
execute unless score *x _slimecore matches 1.. run data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.default_paths.versioned
execute unless score *x _slimecore matches 1.. store success score *x _slimecore run function slimecore:_/util/inline/disable_datapack with storage slimecore:_ x
execute unless score *x _slimecore matches 1.. run data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.default_paths.unversioned
execute unless score *x _slimecore matches 1.. store success score *x _slimecore run function slimecore:_/util/inline/disable_datapack with storage slimecore:_ x

# HOOK: if *x is not exactly 1 here, should warn that datapack was not properly disabled.

data remove storage slimecore:_ v.rebuild.packs[-1]
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/new_packs/each