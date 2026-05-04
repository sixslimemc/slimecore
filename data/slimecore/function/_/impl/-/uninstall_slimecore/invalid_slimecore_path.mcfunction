# IMPL > slimecore:-/uninstall_slimecore
# invalid_slimecore_path
#--------------------
# ./confirm
#--------------------

tellraw @s {text:"SlimeCore uninstallation could not be initiated because the datapack path for SlimeCore itself could not be found.", color:dark_red, bold:true}
tellraw @s {text:"", color:yellow, extra:[{text:"The easiest way to remedy this issue is to rename the SlimeCore datapack (within your world's '"}, {text:"/datapacks", color:gray}, {text:"' directory) to '"}, {text:"slimecore", color:white}, {text:"' or '"}, {text:"sixslime.slimecore", color:white}, {text:"'."}]}
data remove storage slimecore:_ t.uninstall