# UTIL > slimecore:_/util/make_filepath
# do
#--------------------
# ./main
#--------------------
kill @s

data modify entity @s text set value [{text:"file/"},{storage:"slimecore:_/in", nbt:"make_filepath.name"}]
data modify storage slimecore:_/out make_filepath.result set from entity @s text