
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
data modify storage slimecore:in safe_uninstalls.uninstalls set value ["beta", "gamma"]
function slimecore:evaluate/safe_uninstalls
# DEBUG:
tellraw @a ["out: ", {'storage':'slimecore:out', 'nbt':'safe_uninstalls'}]
say END