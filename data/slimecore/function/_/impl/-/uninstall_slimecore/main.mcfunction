# IMPL > slimecore:-/uninstall_slimecore
# main

# immediately start if forced:
execute if data storage slimecore:_ v.uninstall.args{force:true} run return run function slimecore:_/impl/-/uninstall_slimecore/trigger

data modify storage slimecore:_ v.uninstall.msg set value []
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:light_purple, bold:true, extra:[{text:"IMPORTANT:"}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:light_purple, bold:false, extra:[{text:"Uninstalling SlimeCore will disable all SlimeCore-loaded datapacks. All SlimeCore-loaded datapacks will not be functional until SlimeCore is re-installed, and will then need to be manually re-enabled via '/datapack' to properly function again."}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:gold, bold:true, extra:[{text:"[Click to confirm uninstallation]", hover_event:{action:"show_text", value:{text:"Uninstall SlimeCore", bold:true, color:gold}}, click_event:{action:"run_command", command:"function slimecore:_/impl/-/uninstall_slimecore/trigger"}}]}
data modify storage slimecore:_ v.uninstall.msg append value {text:"\n", color:gray, italic:true, bold:false, extra:[{text:"To bypass this confirmation, run:\n"}, {text:" '/function slimecore:-/uninstall_slimecore {args:{force:true}}'.", italic:false}]}

tellraw @s {interpret:true, storage:"slimecore:_", nbt:"v.uninstall.msg"}