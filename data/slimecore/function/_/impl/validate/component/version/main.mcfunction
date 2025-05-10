# IMPL > slimecore : validate/component/version
# main

execute unless data storage slimecore:in version.value.major run data modify storage slimecore:out version.error.missing_data append value {key:'major'}
execute unless data storage slimecore:in version.value.minor run data modify storage slimecore:out version.error.missing_data append value {key:'minor'}
execute unless data storage slimecore:in version.value.patch run data modify storage slimecore:out version.error.missing_data append value {key:'patch'}

execute if data storage slimecore:out version.error run return 0

data modify storage slimecore:in int.value set from storage slimecore:in version.value.major
execute store result score *x _slimecore run function slimecore:validate/component/int
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data append value {key:'major', expected:'positive integer'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.major

data modify storage slimecore:in int.value set from storage slimecore:in version.value.minor
execute store result score *x _slimecore run function slimecore:validate/component/int
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data append value {key:'minor', expected: 'positive integer'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.minor

data modify storage slimecore:in int.value set from storage slimecore:in version.value.patch
execute store result score *x _slimecore run function slimecore:validate/component/int
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data append value {key:'patch', expected: 'positive integer'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.patch

execute if data storage slimecore:out version.error run return 0

execute store result score *x _slimecore run data get storage slimecore:in version.value.major
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data append value {key:'major', expected: 'positive integer'}
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.major

execute store result score *x _slimecore run data get storage slimecore:in version.value.minor
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data append value {key:'minor', expected: 'positive integer'}
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.minor

execute store result score *x _slimecore run data get storage slimecore:in version.value.patch
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data append value {key:'patch', expected: 'positive integer'}
execute unless score *x _slimecore matches 0.. run data modify storage slimecore:out version.error.invalid_data[-1].got set from storage slimecore:in version.value.patch

execute if data storage slimecore:out version.error run return 0

return 1