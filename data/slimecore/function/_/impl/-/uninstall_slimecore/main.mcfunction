# IMPL > slimecore:-/uninstall_slimecore
# main

# immediately start if forced:
execute if data storage slimecore:_ v.uninstall.args{force:true} run return run function slimecore:_/impl/-/uninstall_slimecore/trigger

data modify storage slimecore:_ v.uninstall.msg set value []
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:white, extra:[{text:"Uninstalling SlimeCore will disable all SlimeCore-loaded datapacks. All SlimeCore-loaded datapacks will not be functional until SlimeCore is re-installed, and will then need to be manually re-enabled via '/datapack' to properly function again."}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:white, bold:true, extra:[{text:"Are you sure you want to uninstall SlimeCore?"}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:gold, extra:[{text:"[Click to confirm uninstallation]", hover_event:{action:"show_text", value:{text:"Confirm uninstallation", bold:true, color:gold}}, click_event:{action:"run_command", command:"function slimecore:_/impl/-/uninstall_slimecore/trigger"}}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n\n", color:gray, italic:true, extra:[{text:"To bypass this confirmation, run '/function slimecore:-/uninstall_slimecore {args:{force:true}}'."}]}

tellraw @s {interpret:true, storage:"slimecore:_", nbt:"v.uninstall.msg"}