#> slimecore:_/build/pass_2/get_deps.1

$data modify storage slimecore:_ var.build.restack[-1].deps append from storage slimecore:_ var.build.retrieved_man.dependencies[{order:{'$(this_load)':$(dep_direction)b}}]
$data modify storage slimecore:_ var.build.restack[-1].deps append from storage slimecore:_ var.build.retrieved_man.supports[{order:{'$(this_load)':$(dep_direction)b}}]