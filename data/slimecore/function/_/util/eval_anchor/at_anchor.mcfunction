# UTIL > slimecore :_/util/ eval_anchor
# at_anchor
# AT [anchor pos]
#--------------------
# ./start
#--------------------

$execute store result score *x _slimecore run $(command)
$setblock ~ ~ ~ $(block)
return run scoreboard players get *x _slimecore