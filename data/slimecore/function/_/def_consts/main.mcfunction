#> slimecore:_/def_consts/main
#--------------------
# ../init
#--------------------

# scores:
scoreboard players set *-1 _slimecore -1

# alphabet:
data modify storage slimecore:_ var.const.alphabet_order set value ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ".", "-", "_"]


data modify storage slimecore:_ const.alphabet.map set value {a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9, k:10, l:11, m:12, n:13, o:14, p:15, q:16, r:17, s:18, t:19, u:20, v:21, w:22, x:23, y:24, z:25, '.': 26, '-':27, '_':28}

data modify storage slimecore:_ const.alphabet.empty_buffer set value []
execute store result score *i _slimecore run data get storage slimecore:_ const.alphabet.max_index
execute if score *i _slimecore matches 0.. run function slimecore:_/def_consts/alphabet/empty_buffer