# IMPL > slimecore:eval/pack
# url_check/each
#--------------------
# ./do
#--------------------

data modify storage slimecore:_ v.pack.this_path set from storage slimecore:_ v.pack.url_paths[-1]

data remove storage slimecore:_ v.pack.this_url
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.pack.this_url set from storage slimecore:in pack.pack.", 2:true}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.pack.this_path
function slimecore:_/util/mline/2 with storage slimecore:_ x.mline

execute if data storage slimecore:_ v.pack.this_url run function slimecore:_/impl/eval/pack/url_check/check

data remove storage slimecore:_ v.pack.url_paths[-1]
execute if data storage slimecore:_ v.pack.url_paths[0] run function slimecore:_/impl/eval/pack/url_check/each