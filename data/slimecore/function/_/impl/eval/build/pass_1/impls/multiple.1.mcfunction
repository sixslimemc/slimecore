# IMPL > slimecore:eval/build
# pass_1/impls/multiple.1

data modify storage slimecore:out build.result.error.multiple_implementations append value {of:{}, from:[{}]}
data modify storage slimecore:out build.result.error.multiple_implementations[0].of set from storage slimecore:_ v.build.this_impl
data modify storage slimecore:out build.result.error.multiple_implementations[0].from[0].pack_ref set from storage slimecore:_ v.build.seen_impl.pack_id