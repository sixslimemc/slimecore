#> slimecore:_/build/pass_order/loads/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.load_words[-1]


# get {..current_order}, {..required_before}:
function slimecore:_/build/pass_order/loads/get_m with storage slimecore:_ var.build

# sets *build.insertion_index to where this pack should be inserted in order:
scoreboard players operation *build.insertion_index _slimecore = *build.order_ptr _slimecore
execute if data storage slimecore:_ var.build.required_before[0] if data storage slimecore:_ var.build.current_order[0] run function slimecore:_/build/pass_order/loads/order/each

# insert {..this_pack} into the final order:
execute store result storage slimecore:_ var.build.insertion_index int 1 run scoreboard players get *build.insertion_index _slimecore
function slimecore:_/build/pass_order/loads/insert_in_order with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.load_words[-1]
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_order/loads/each