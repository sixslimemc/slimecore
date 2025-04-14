# slimecore:_/build/pass_2/depstack/make_relation
#--------------------
# ./each
#--------------------

# WITH
# -> build.make_relation.a
# -> build.make_relation.b
# -> build.make_relation.orderset: 'load' | 'pre_load' | 'post_load'
# -> build.make_relation.direction: LoadOrderRequirement
# 'direction' is <b>'s relation to <a>

data merge storage slimecore:_ {var:{build:{rel:{template:{load:[], pre_load:[], post_load:[]}}}}}

$data modify storage slimecore:_ var.build.rel.a set from storage slimecore:_ var.build.maps.relations.'$(a)'
$data modify storage slimecore:_ var.build.rel.b set from storage slimecore:_ var.build.maps.relations.'$(b)'

execute unless data storage slimecore:_ var.build.rel.a run data modify storage slimecore:_ var.build.rel.a set from storage slimecore:_ var.build.rel.template
execute unless data storage slimecore:_ var.build.rel.b run data modify storage slimecore:_ var.build.rel.b set from storage slimecore:_ var.build.rel.template

# a -> b
execute store result score *build.rel.r _slimecore run data get storage slimecore:_ var.build.make_relation.direction
$data modify storage slimecore:_ var.build.rel.this_r set from storage slimecore:_ var.build.rel.a.$(orderset)[{pack:'$(b)'}]
execute store result score *build.rel.er _slimecore run data get storage slimecore:_ var.build.rel.this_r.direction
execute store success score *build.rel.fail _slimecore if data storage slimecore:_ var.build.rel.this_r unless score *build.rel.r _slimecore matches 0 unless score *build.rel.r _slimecore = *build.rel.er _slimecore

$execute if score *build.rel.fail _slimecore matches 1.. run data modify storage slimecore:_ var.build.error.relations.$(orderset) append value {a:'$(a)', b:'$(b)'}

execute store success score *build.rel.should_add _slimecore unless score *build.rel.r _slimecore matches 0 unless score *build.rel.fail _slimecore matches 1.. unless data storage slimecore:_ var.build.rel.this_r
$execute if score *build.rel.should_add _slimecore matches 1.. run data modify storage slimecore:_ var.build.rel.a.$(orderset) append value {pack:'$(b)', direction:0b}
$execute if score *build.rel.should_add _slimecore matches 1.. store result storage slimecore:_ var.build.rel.a.$(orderset)[-1].direction byte -1 run scoreboard players get *build.rel.r _slimecore

data remove storage slimecore:_ var.build.rel.this_r
scoreboard players reset *build.rel.er _slimecore
scoreboard players reset *build.rel.fail _slimecore
# b -> a
scoreboard players operation *build.rel.r _slimecore *= *-1 _slimecore
$data modify storage slimecore:_ var.build.rel.this_r set from storage slimecore:_ var.build.rel.b.$(orderset)[{pack:'$(a)'}]
execute store result score *build.rel.er _slimecore run data get storage slimecore:_ var.build.rel.this_r.direction
execute store success score *build.rel.fail _slimecore if data storage slimecore:_ var.build.rel.this_r unless score *build.rel.r _slimecore matches 0 unless score *build.rel.r _slimecore = *build.rel.er _slimecore

$execute if score *build.rel.fail _slimecore matches 1.. run data modify storage slimecore:_ var.build.error.relations.$(orderset) append value {a:'$(a)', b:'$(b)'}

execute store success score *build.rel.should_add _slimecore unless score *build.rel.r _slimecore matches 0 unless score *build.rel.fail _slimecore matches 1.. unless data storage slimecore:_ var.build.rel.this_r
$execute if score *build.rel.should_add _slimecore matches 1.. run data modify storage slimecore:_ var.build.rel.b.$(orderset) append value {pack:'$(a)', direction:0b}
$execute if score *build.rel.should_add _slimecore matches 1.. store result storage slimecore:_ var.build.rel.b.$(orderset)[-1].direction byte -1 run scoreboard players get *build.rel.r _slimecore

$execute if data storage slimecore:_ var.build.error.relations.$(orderset) run scoreboard players set *build.error _slimecore 1

$data modify storage slimecore:_ var.build.maps.relations.'$(a)' set from storage slimecore:_ var.build.rel.a
$data modify storage slimecore:_ var.build.maps.relations.'$(b)' set from storage slimecore:_ var.build.rel.b

data remove storage slimecore:_ var.build.rel