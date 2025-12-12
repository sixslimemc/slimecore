# IMPL > slimecore:eval/pack
# dupe_check/each.1

$execute store result score *x _slimecore if data storage slimecore:_ v.pack.dupe_checks[{'$(id_key)':'$(id)'}]
$data remove storage slimecore:_ v.pack.dupe_checks[{'$(id_key)':'$(id)'}]
$execute if score *x _slimecore matches 2.. run function slimecore:_/impl/eval/pack/dupe_check/duplicate {id:'$(id)'}