# IMPL > slimecore:eval/pack
# url_check/do
#--------------------
# ../main
#--------------------
kill @s

data modify storage slimecore:_ v.pack.url_paths set value ['url', 'display.links.author', 'display.links.versions', 'display.links.info']
execute if data storage slimecore:_ v.pack.url_paths[0] run function slimecore:_/impl/eval/pack/url_check/each
