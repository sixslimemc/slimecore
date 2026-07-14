#> slimecore :_/util/ eval_anchor
#--------------------
# -> command: command
#--------------------
# .
#--------------------
# TODO: description
#--------------------
# ..: return value of <command>
#--------------------

data modify storage slimecore:_ u.eval_anchor set from storage slimecore:_ data.eval_anchor
data modify storage slimecore:_ u.eval_anchor.command set from storage slimecore:_/in eval_anchor.command
execute store result score *x _slimecore run function slimecore:_/util/eval_anchor/start with storage slimecore:_ u.eval_anchor

data remove storage slimecore:_ u.eval_anchor
data remove storage slimecore:_/in eval_anchor

return run scoreboard players get *x _slimecore