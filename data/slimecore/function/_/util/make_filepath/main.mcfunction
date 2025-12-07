#> slimecore :_/util/ make_filepath
#--------------------
# -> name: string
#--------------------
# <- result: DatapackPath
#--------------------
# literally just returns "file/<name>"
#--------------------
# 1.
#--------------------

data remove storage slimecore:_/out make_filepath

execute summon text_display run function slimecore:_/util/make_filepath/do
data remove storage slimecore:_/in make_filepath

return 1