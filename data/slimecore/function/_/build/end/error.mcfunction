#> slimecore:_/build/end/error
#--------------------
# ../start
#--------------------

# {build.error} :
#- duplicates[]: {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]: {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]: { root: PackInfo, cycle[]: PackID }
#- relations[]: LoadSpec<&Conflict>
#-- where &Conflict := {a: PackID, b: PackID}

function slimecore:_/build/end/end
