#> slimecore:_/util/combine_context/text
#--------------------
# ./main
#--------------------

data modify entity @s text set value ""

execute if data storage slimecore:_/in combine_context.contexts[0] run function slimecore:_/util/combine_context/contexts/each

data modify storage slimecore:_/out combine_text.result set from entity @s text.text
kill @s