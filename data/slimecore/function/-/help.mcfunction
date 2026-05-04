#> slimecore :-/ help

tellraw @s ""
data modify storage slimecore:_ x.text set value {text:"[Click to open SlimeCore info URL]", color:green, bold:true, underlined:true, hover_event:{action:"show_text", value:{text:"Open URL", color:gray}}, click_event:{action:"open_url", url:"URL"}}
data modify storage slimecore:_ x.text.click_event.url set from storage slimecore:data slimecore.display.links.info

tellraw @s {interpret:true, storage:"slimecore:_", nbt:"x.text"}

data remove storage slimecore:_ x.text
