#> slimecore:_/build/end/error
#--------------------
# ../main
#--------------------

# {var.build.error} :
#- duplicates[]: {pack: $PackID, instances[]: PackManifest}
#- multiple_implementations[]: {pack: $PackID, sources[]: PackManifest}
#- dependency_cycles[]: { root: PackManifest, cycle[]: $PackID }
#- relations: LoadWords<[]&Conflict>
#- missing_dependencies[]: {dependency: PackRequirement, dependent: PackManifest, bad_version? &BadVersionInfo}
#- missing_implementations[]: {manifest: PackManifest}
#-- where &Conflict := {a: $PackID, b: $PackID}
#-- where &BadVersionInfo := {installed: PackManifest, version_index: 0b | 1b (major | minor)}

data modify storage slimecore:_ build.out.error set from storage slimecore:_ var.build.error

function slimecore:_/build/end/end
return 0