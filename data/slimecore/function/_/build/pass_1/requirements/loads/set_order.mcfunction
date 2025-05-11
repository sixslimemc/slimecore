#> slimecore:_/build/pass_1/requirements/loads/set_order
#--------------------
# ./each
#--------------------

$execute unless data storage slimecore:_ var.build.requirements.out[-1].order{'$(this_load)':0b} run return 0

$data modify storage slimecore:_ var.build.requirements[-1].order.'$(this_load)' set from storage slimecore:_ build.in.manifests[{pack:'$(req_pack)'}].expected_order.'$(this_load)'