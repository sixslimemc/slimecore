#> slimecore:_/build/pass_order/loads/order/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_order_entry set from storage slimecore:_ var.build.current_order[-1].pack
scoreboard players remove *build.insertion_index _slimecore 1

# DEBUG:
tellraw @a ["SEARCH: ", {'storage':'slimecore:_', 'nbt':'var.build.this_order_entry'}]

function slimecore:_/build/pass_order/loads/order/fulfill_requirement with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.current_order[-1]
# ASSERT: if {..required_before[0]} exists: {..current_order[0]} exists too.
execute if data storage slimecore:_ var.build.required_before[0] if data storage slimecore:_ var.build.current_order[0] run function slimecore:_/build/pass_order/loads/order/each
