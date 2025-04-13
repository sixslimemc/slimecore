#> slimecore:_/build/end/error
#--------------------
# ../main
#--------------------

# {var.build.error} :
#- duplicates[]: {pack: PackID, instances[]: PackInfo}
#- multiple_implementations[]: {pack: PackID, sources[]: PackInfo}
#- dependency_cycles[]: { root: PackInfo, cycle[]: PackID }
#- relations: LoadSpec<[]&Conflict>
#- missing_dependencies[]: {dependency: PackRequirement, dependent: PackInfo, bad_version? &BadVersionInfo}
#- missing_implementations[]: {manifest: PackInfo}
#-- where &Conflict := {a: PackID, b: PackID}
#-- where &BadVersionInfo := {installed: PackInfo, version_index: 0b | 1b (major | minor)}

function slimecore:_/build/end/end
return 0