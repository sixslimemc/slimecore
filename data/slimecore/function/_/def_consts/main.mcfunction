#> slimecore:_/def_consts/main
#--------------------
# ../init
#--------------------

data remove storage slimecore:_ const

# scores:
scoreboard players set *-1 _slimecore -1

# alphabet:
data modify storage slimecore:_ var.const.alphabet_order set value ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", "-", "_"]

execute store result score *i _slimecore if data storage slimecore:_ var.const.alphabet_order[]
scoreboard players remove *i _slimecore 1
execute store result storage slimecore:_ const.alphabet.max_index int 1 run scoreboard players get *i _slimecore

data modify storage slimecore:_ const.alphabet.map set value {}
execute if score *i _slimecore matches 0.. run function slimecore:_/def_consts/alphabet/gen_map

data modify storage slimecore:_ const.alphabet.empty_buffer set value []
execute store result score *i _slimecore run data get storage slimecore:_ const.alphabet.max_index
execute if score *i _slimecore matches 0.. run function slimecore:_/def_consts/alphabet/empty_buffer

# load:
data modify storage slimecore:_ const.load_words set value ["pre_load", "load", "post_load", "tick"]
data modify storage slimecore:_ const.load_tags set value [{word: 'tick', tag: 'tick_start'},{word: 'post_load', tag: 'post_load'},{word: 'load', tag: 'load'},{word: 'pre_load', tag: 'pre_load'}]

data modify storage slimecore:_ const.default_load_order set value {pre_load:0b, load:1b, post_load:0b, tick:0b}

# validation
function slimecore:_/def_consts/validation

data remove storage slimecore:_ var.const