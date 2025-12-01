#> slimecore:_/util/combine_context/contexts/each
#--------------------
# ../text
#--------------------

data modify storage slimecore:_ u.combine_context.text set from entity @s text
execute unless data storage slimecore:_/in combine_context.contexts[-1].index run data modify entity @s text set value [{storage:"slimecore:_", nbt:"u.combine_context.text"},{text:"."},{storage:"slimecore:_/in", nbt:"combine_context.contexts[-1].path"}]
execute if data storage slimecore:_/in combine_context.contexts[-1].index run data modify entity @s text set value [{storage:"slimecore:_", nbt:"u.combine_context.text"},{text:"."},{storage:"slimecore:_/in", nbt:"combine_context.contexts[-1].path"},{text:"["},{storage:"slimecore:_/in", nbt:"combine_context.contexts[-1].index"},{text:"]"}]

data remove storage slimecore:_/in combine_context.contexts[-1]
execute if data storage slimecore:_/in combine_context.contexts[0] run function slimecore:_/util/combine_context/contexts/each