# IMPL > slimecore:eval/pack
# dependencies/each
#--------------------
# ../main
#--------------------

scoreboard players set *pack.dep_err _slimecore 0
scoreboard players remove *pack.index _slimecore 1
data modify storage slimecore:_ v.pack.this_dependency set from storage slimecore:_ v.pack.dependencies[-1]

# check version:
data remove storage slimecore:_ v.pack.version_err
data modify storage slimecore:in version_req.requirement set from storage slimecore:_ v.pack.this_dependency.version
data modify storage slimecore:in version_req.version set from storage slimecore:_ v.pack.this_dependency.download.version
function slimecore:eval/version_req
data modify storage slimecore:_ v.pack.version_err set from storage slimecore:out version_req.result.error
execute if data storage slimecore:_ v.pack.version_err run function slimecore:_/impl/eval/pack/dependencies/invalid_version

# check url:
data modify storage slimecore:_ x.text set value {text:"", click_event:{action:"open_url", url:""}}
data modify storage slimecore:_ x.text.click_event.url set from storage slimecore:_ v.pack.this_dependency.download.url
data modify entity @s text set from storage slimecore:_ x.text
execute unless data entity @s text.click_event.url run function slimecore:_/impl/eval/pack/dependencies/invalid_url

data remove storage slimecore:_ v.pack.dependencies[-1]
execute if data storage slimecore:_ v.pack.dependencies[0] run function slimecore:_/impl/eval/pack/dependencies/each