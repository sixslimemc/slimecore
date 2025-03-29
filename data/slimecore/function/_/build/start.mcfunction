#> slimecore:build/start
#--------------------
# ../init
#--------------------


data modify storage slimecore:_ build.packmap set value {}
data remove storage slimecore:_ build.errors
scoreboard players set *build.error _slimecore 0

data modify storage slimecore:_ build.manifests set from storage slimecore:_ init.manifests
execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/first_pass/each

execute if score *build.error _slimecore matches 1.. run return run function slimecore:_/build/end/error

data modify storage slimecore:_ build.manifests set from storage slimecore:_ init.manifests
execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/second_pass/each
