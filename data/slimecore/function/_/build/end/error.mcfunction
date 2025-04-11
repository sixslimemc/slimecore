#> slimecore:_/build/end/error
#--------------------
# ../main
#--------------------

# {var.build.error} :
#- duplicates[]: {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]: {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]: { root: PackInfo, cycle[]: PackID }
#- relations: LoadSpec<[]&Conflict>
#- missing_dependencies[]: {dependency: PackRequirement, dependent: PackInfo}
#- missing_implementations[]: {pack: PackInfo}
#-- where &Conflict := {a: PackID, b: PackID}

function slimecore:_/build/end/end
