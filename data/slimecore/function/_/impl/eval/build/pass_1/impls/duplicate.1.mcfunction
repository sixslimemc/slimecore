# IMPL > slimecore:eval/build
# pass_1/impls/duplicate.1

data modify storage slimecore:out build.result.error.multiple_implementations append value {of:{}, from:[{},{}]}
data modify storage slimecore:out build.result.error.multiple_implementations[0].of set from storage slimecore:_ v.build.this_impl
data modify storage slimecore:out build.result.error.multiple_implementations[0].from[0].pack_ref set from storage slimecore:_ v.build.seen_impl.pack_id
data modify storage slimecore:out build.result.error.multiple_implementations[0].from[1].pack_ref set from storage slimecore:_ v.build.this_pack.pack_id