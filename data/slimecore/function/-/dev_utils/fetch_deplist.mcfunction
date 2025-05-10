#> slimecore :-/ dev_utils/fetch_deplist
#--------------------
# $> packs[]: $PackID
#--------------------
# TODO: description
#--------------------

$data merge storage slimecore:_ {impl:{fetch_deplist:{input:{packs:$(packs)}}}}

function slimecore:_/impl/-/dev_utils/fetch_deplist/main

data remove storage slimecore:_ impl.fetch_deplist