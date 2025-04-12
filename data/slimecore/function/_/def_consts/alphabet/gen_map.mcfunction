#> slimecore:_/def_consts/alphabet/gen_map
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.const.macro.char set from storage slimecore:_ var.const.alphabet_order[-1]
function slimecore:_/def_consts/alphabet/gen_map.1 with storage slimecore:_ var.const.macro

data remove storage slimecore:_ var.const.alphabet_order[-1]
scoreboard players remove *i _slimecore 1
execute if score *i _slimecore matches 0.. run function slimecore:_/def_consts/alphabet/gen_map