#> slimecore : eval/build
#--------------------
# -> packs: [(PackManifest | any)]
#--------------------
# <- result: EvalResult<Build, {
#   invalid_packs?: [{pack: (PackManifest | any), error: eval::pack::Error}],
#   duplicate_pack_ids?: [{pack_id: PackId, packs: [PackManifest]}],
#   multiple_implementations?: [{of: AbstractReference, sources: [PackReference]}],
#   unfulfilled_dependencies?: [{from: PackId, dependency: Dependency,
#       reason: {
#           not_present?: PackId,
#           author_mismatch?: {expected: AuthorId, got: AuthorId},
#           incompatible_version?: eval::version_req::Error
#       }}]
#   unimplemented_abstracts?: [{from: PackId, id: AbstractId}]
#   dependency_cycles?: [[PackReference]]
#   entrypoint_order_conflicts?: [{conflicting_group:[EntrypointReference<EntrypointId>]]
#   preload_entrypoint_order_conflicts?: [{conflicting_group:[EntrypointReference<PreloadEntrypointId>]]
#   TODO
# }>
#--------------------
# TODO: description
#--------------------
# 1: success
# 0: error
#--------------------

data remove storage slimecore:out build

execute store result score *x _slimecore run function slimecore:_/impl/eval/build/main

data remove storage slimecore:_ v.build
data remove storage slimecore:in build

return run scoreboard players get *x _slimecore