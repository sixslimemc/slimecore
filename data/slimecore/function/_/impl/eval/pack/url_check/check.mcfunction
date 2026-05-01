# IMPL > slimecore:eval/pack
# url_check/check
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ x.text set value {text:"", click_event:{action:"open_url", url:""}}
data modify storage slimecore:_ x.text.click_event.url set from storage slimecore:_ v.pack.this_url
data modify entity @s text set from storage slimecore:_ x.text

execute unless data entity @s text.click_event.url run function slimecore:_/impl/eval/pack/url_check/invalid