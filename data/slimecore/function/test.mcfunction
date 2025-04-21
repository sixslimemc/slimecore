
data modify storage slimecore:in safe_uninstalls.build set from storage slimecore:data current_build
data modify storage slimecore:in safe_uninstalls.uninstalls set value ["beta"]
function slimecore:evaluate/safe_uninstalls
# DEBUG:
tellraw @a ["TEST: ", {'storage':'slimecore:out', 'nbt':'safe_uninstalls'}]
say END