#> slimecore:_/impl/-/authoring/fetch_requirements/each
#--------------------
# ./main
#--------------------

data remove storage slimecore:_ v.fetch_requirements.fetched
$execute store success score *x _slimecore run data modify storage slimecore:_ v.fetch_requirements.fetched set from storage slimecore:data current_build.auxilary.pack_map.'$(this_pack)'
execute unless score *x _slimecore matches 1 run return fail

data modify storage slimecore:_ v.fetch_requirements.list append value {}
data modify storage slimecore:_ v.fetch_requirements.list[-1].pack set from storage slimecore:_ v.fetch_requirements.fetched.pack
data modify storage slimecore:_ v.fetch_requirements.list[-1].version set from storage slimecore:_ v.fetch_requirements.fetched.version
data modify storage slimecore:_ v.fetch_requirements.list[-1].url set from storage slimecore:_ v.fetch_requirements.fetched.url
data modify storage slimecore:_ v.fetch_requirements.list[-1].order set from storage slimecore:_ const.default_load_order

return 1