#> slimecore:_/def_consts/alphabet/empty_buffer
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ const.alphabet.empty_buffer append value []

scoreboard players remove *i _slimecore 1
execute if score *i _slimecore matches 0.. run function slimecore:_/def_consts/alphabet/empty_buffer