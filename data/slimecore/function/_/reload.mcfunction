#> slimecore:_/reload
# MINECRAFT : LOAD

# if uninstalling, ignore reload and continue uninstalling
execute if score *uninstalling _slimecore matches 1.. run return run function slimecore:_/impl/-/uninstall_slimecore/continue

# if rebuilding, ignore reload and continue building:
execute if score *just_rebuilt _slimecore matches 1.. run function slimecore:_/load/main
execute if score *just_rebuilt _slimecore matches 1.. run return run scoreboard players reset *just_rebuilt _slimecore

# setup:
scoreboard objectives add _slimecore dummy

# set slimecore metadata:
data remove storage slimecore:data slimecore
data modify storage slimecore:data slimecore set value {pack_id:"slimecore", author_id:"sixslime", dependencies:[], abstract_declarations:[], abstract_implementations:[], entrypoints:[], preload_entrypoints:[], is_library:false, display:{name:"SlimeCore", author_name:"SixSlime", summary:"The SlimeCore datapack loader and manager.", links:{author:"https://github.com/sixslimemc", info:"https://github.com/sixslimemc/slimecore", versions:"https://github.com/sixslimemc/slimecore"}}, url:"https://github.com/sixslimemc/slimecore/releases/download/0.1.0/sixslime.slimecore%200.1.0.zip", version:{major:0, minor:1, patch:0}}

# init:
execute unless score *init _slimecore matches 1 run function slimecore:_/init
scoreboard players set *init _slimecore 1

#HOOK: meta_info/before_reload_check
function #slimecore:hook/meta_info/before_reload_check

# if automatic rebuild disabled, load and return:
execute if data storage slimecore:config {explicit_rebuild_only:true} run return run function slimecore:_/load/main

# check if needs rebuild:
function slimecore:_/get_manifests
execute store success score *reload.needs_rebuild _slimecore run data modify storage slimecore:_ data.rebuild_check.manifests set from storage slimecore:_ data.manifest_packs
execute unless score *reload.needs_rebuild _slimecore matches 1 store success score *reload.needs_rebuild _slimecore run data modify storage slimecore:_ data.rebuild_check.datapack_path_overrides set from storage slimecore:config datapack_path_overrides
execute unless score *reload.needs_rebuild _slimecore matches 1 unless data storage slimecore:_ data.rebuild_check{last_success:1b} run scoreboard players set *reload.needs_rebuild _slimecore 1

# rebuild:
execute if score *reload.needs_rebuild _slimecore matches 1 store result storage slimecore:_ data.rebuild_check.last_success byte 1 run return run function slimecore:rebuild

function slimecore:_/load/main