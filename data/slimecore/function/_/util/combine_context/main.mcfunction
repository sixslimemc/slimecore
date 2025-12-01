#> slimecore :_/ combine_context
#--------------------
# -> contexts: [({path:string, index?: int}]
#--------------------
# <- result: string
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data remove storage slimecore:_/out combine_context

execute summon text_display run function slimecore:_/util/combine_context/text

data remove storage slimecore:_ u.combine_context
data remove storage slimecore:_/in combine_context

return 1