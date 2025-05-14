#> slimecore :-/ authoring/fetch_requirements
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

$data merge storage slimecore:_ {impl:{fetch_requirements:{input:{packs:$(packs)}}}}

function slimecore:_/impl/-/authoring/fetch_requirements/main

data remove storage slimecore:_ impl.fetch_requirements