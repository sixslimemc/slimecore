# IMPL > slimecore:rebuild
# new_packs/each
#--------------------
# ../process
#--------------------
# forward order

data modify storage slimecore:_ v.rebuild.this_pack set from storage slimecore:_ v.rebuild.packs[0]

data modify storage slimecore:_ x.pack_id set from storage slimecore:_ v.rebuild.this_pack.pack_id
function slimecore:_/impl/rebuild/get_override with storage slimecore:_ x

data modify storage slimecore:_/in default_filepaths.pack_id set from storage slimecore:_ v.rebuild.this_pack.pack_id
data modify storage slimecore:_/in default_filepaths.version set from storage slimecore:_ v.rebuild.this_pack.version
function slimecore:_/util/default_filepaths/main
data modify storage slimecore:_ v.rebuild.default_paths set from storage slimecore:_/out default_filepaths.result

data remove storage slimecore:_ v.rebuild.linked_path
scoreboard players set *rebuild.found_path _slimecore 0
execute store success score *rebuild.is_override _slimecore if data storage slimecore:_ v.rebuild.override_path

# try_enable sets {..linked_path} if succeeds

# override:
execute if score *rebuild.is_override _slimecore matches 1 run data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.override_path
execute store result score *rebuild.found_path _slimecore run function slimecore:_/impl/rebuild/new_packs/try_enable with storage slimecore:_ x

# versioned:
execute if score *rebuild.is_override _slimecore matches 0 run data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.default_paths.versioned
execute if score *rebuild.is_override _slimecore matches 0 store result score *rebuild.found_path _slimecore run function slimecore:_/impl/rebuild/new_packs/try_enable with storage slimecore:_ x

# unversioned:
execute if score *rebuild.is_override _slimecore matches 0 if score *rebuild.found_path _slimecore matches 0 run data modify storage slimecore:_ x.path set from storage slimecore:_ v.rebuild.default_paths.unversioned
execute if score *rebuild.is_override _slimecore matches 0 if score *rebuild.found_path _slimecore matches 0 store result score *rebuild.found_path _slimecore run function slimecore:_/impl/rebuild/new_packs/try_enable with storage slimecore:_ x

# missing error:
execute unless score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/new_packs/missing_path

# add to {..new_data.world.datapack_links}
execute if score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/new_packs/add_link

data remove storage slimecore:_ v.rebuild.packs[0]
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/new_packs/each