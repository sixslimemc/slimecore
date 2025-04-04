#> six:api > object/partial
#--------------------
# -> object: obj
# => get: {only: string[]} | {without: string[]} | {} = {}
#--------------------
# <- result: obj[]
#--------------------
#> if <get.only>: gets <object> with ONLY the fields specified in <get.only>
#> if <get.without>: gets <object> WITHOUT the fields specified in <get.without>
#--------------------
#- if neither <get.without> nor <get.only> are specified, just returns <object>
#--------------------
# 1 - <get.only> or <get.without> was specified
# 0 - <get.only> or <get.without> was not specified
#--------------------

data remove storage slimecore:_ util.partial.out
execute unless data storage slimecore:_ util.partial.in.get.without unless data storage slimecore:_ util.partial.in.get.only run return run function slimecore:_/util/six/object/partial/none

execute if data storage slimecore:_ util.partial.in.get.only run function slimecore:_/util/six/object/partial/only
execute if data storage slimecore:_ util.partial.in.get.without run function slimecore:_/util/six/object/partial/without

data remove storage slimecore:_ util.partial.in
data remove storage slimecore:_ util.partial.var