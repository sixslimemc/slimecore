# IMPL > slimecore:-/uninstall_slimecore
# main

tellraw @s [{text: "[SlimeCore uninstall initiated]", color: "gray"}]
data modify storage slimecore:_ v.uninstall.packs set from storage slimecore:data world.datapack_links
execute if data storage slimecore:_ v.uninstall.packs[0] run function slimecore:_/impl/-/uninstall_slimecore/packs/each

tag @s add _slimecore.uninstaller
scoreboard players set *uninstall _slimecore 1
reload