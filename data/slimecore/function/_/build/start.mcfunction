#> slimecore:build/start
#--------------------
# ../init
#--------------------

data modify storage slimecore:_ build.manifests set from storage slimecore:_ init.manifests

data modify storage slimecore:_ build.packmap set value {}

execute if data storage slimecore:_ build.manifests[0] run function slimecore:_/build/first_pass/each

data remove storage slimecore:_ build