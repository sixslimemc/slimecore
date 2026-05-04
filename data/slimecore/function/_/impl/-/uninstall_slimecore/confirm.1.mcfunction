# IMPL > slimecore:-/uninstall_slimecore
# confirm.1

tellraw @s {text:"Uninstalling SlimeCore (this may take a moment)...", color:gold, bold:true}

# HOOK: meta_info/uninstall_slimecore
function #slimecore:hook/uninstall_slimecore

# disable packs:
data modify storage slimecore:_ t.uninstall.packs set from storage slimecore:data build.packs
execute if data storage slimecore:_ t.uninstall.packs[0] run function slimecore:_/impl/-/uninstall_slimecore/packs/each

function slimecore:_/uninstall_data

$datapack disable "$(slimecore_path)"

tellraw @s {text:"SlimeCore has been uninstalled.", color:white, bold:true}