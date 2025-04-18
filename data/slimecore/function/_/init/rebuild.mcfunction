#> slimecore:_/init/rebuild
#--------------------
# ./main
#--------------------

data modify storage slimecore:in build.packs append from storage slimecore:_ manifests.valid[].pack_info
execute store result score *init.build_success _slimecore run function slimecore:evaluate/build