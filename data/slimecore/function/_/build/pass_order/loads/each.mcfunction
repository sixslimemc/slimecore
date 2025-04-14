#> slimecore:_/build/pass_order/loads/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.load_words[-1]


# get {..current_order}, {..required_before}:
function slimecore:_/build/pass_order/loads/get_m with storage slimecore:_ var.build

# DEBUG:
tellraw @a ["PRE: ", {'storage':'slimecore:_', 'nbt':'var.build.required_before'}]

# filter {..required_before} so it only contains packs in current_order:
# INEFF: this is a heavy operation and probably could be optimized
data modify storage slimecore:_ util.intersection.in.a set from storage slimecore:_ var.build.required_before
data modify storage slimecore:_ util.intersection.in.b set from storage slimecore:_ var.build.current_order
function slimecore:_/util/six/array/intersection/main
data modify storage slimecore:_ var.build.required_before set from storage slimecore:_ util.intersection.out.shared

# DEBUG:
tellraw @a ["ORDER: ", {'storage':'slimecore:_', 'nbt':'var.build.current_order'}]
# DEBUG:
tellraw @a ["LOOK FOR: ", {'storage':'slimecore:_', 'nbt':'var.build.required_before'}]

# sets *build.insertion_index to where this pack should be inserted in order:
scoreboard players operation *build.insertion_index _slimecore = *build.order_ptr _slimecore
execute if data storage slimecore:_ var.build.required_before[0] if data storage slimecore:_ var.build.current_order[0] run function slimecore:_/build/pass_order/loads/order/each

# insert {..this_pack} into the final order:
execute store result storage slimecore:_ var.build.insertion_index int 1 run scoreboard players get *build.insertion_index _slimecore
function slimecore:_/build/pass_order/loads/insert_in_order with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.load_words[-1]
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_order/loads/each