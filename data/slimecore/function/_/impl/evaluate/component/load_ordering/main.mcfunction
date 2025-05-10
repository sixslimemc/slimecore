# IMPL > slimecore : evaluate/component/load_ordering
# / main

data modify storage slimecore:_ v.load_ordering.loads set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ v.load_ordering.loads[0] run function slimecore:_/impl/evaluate/component/load_ordering/loads/each

execute if data storage slimecore:out load_ordering.error run data remove storage slimecore:out load_ordering.value
execute if data storage slimecore:out load_ordering.error run return 0

return 1