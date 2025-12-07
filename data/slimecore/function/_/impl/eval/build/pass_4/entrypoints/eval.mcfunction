# IMPL > slimecore:eval/build
# pass_4/entrypoints/eval
#--------------------
# ./each
#--------------------

# IN {..evalin[-1]}:
# -> id
# -> pack_ref

# OUT {..evalout} => {..maps.<pack_ref>.<id>} entry
data remove storage slimecore:_ v.build.evalout
data modify storage slimecore:_ v.build.eval append value {}

# sets {..evalout}
data modify storage slimecore:_ x.macro set from storage slimecore:_ v.build.evalin[-1]
data modify storage slimecore:_ x.macro.map_key set from storage slimecore:_ v.build.map_key
data modify storage slimecore:_ x.macro.pack_key set from storage slimecore:_ v.build.pack_key
# DEBUG:
tellraw @a ["DATA ", {'storage':'slimecore:_', 'nbt':'x.macro'}]
function slimecore:_/impl/eval/build/pass_4/entrypoints/eval.1 with storage slimecore:_ x.macro

data remove storage slimecore:_ v.build.eval[-1]
data remove storage slimecore:_ v.build.evalin[-1]