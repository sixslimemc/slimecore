# IMPL > slimecore : validate/component/pack_id
# main

$data get storage $(value):_ _
execute if data storage slimecore:in pack_id{value:'minecraft'} run return -1
execute if data storage slimecore:in pack_id{value:'slimecore'} run return -2

return 1