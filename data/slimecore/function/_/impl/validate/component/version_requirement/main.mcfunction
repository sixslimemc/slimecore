# IMPL > slimecore : validate/component/version_requirement
# main

execute unless data storage slimecore:in version_requirement.value.major run data modify storage slimecore:out version_requirement.error.missing_data append value {key:'major'}
execute unless data storage slimecore:in version_requirement.value.minor run data modify storage slimecore:out version_requirement.error.missing_data append value {key:'minor'}
execute if data storage slimecore:out version_requirement.error run return 0

