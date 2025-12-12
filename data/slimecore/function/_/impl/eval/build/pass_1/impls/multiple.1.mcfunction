# IMPL > slimecore:eval/build
# pass_1/impls/multiple.1

data modify storage slimecore:_ x.entry set value {of:{}, sources:[{}]}
data modify storage slimecore:_ x.entry.of set from storage slimecore:_ v.build.this_impl
data modify storage slimecore:_ x.entry.sources[0].pack_ref set from storage slimecore:_ v.build.seen_impl.pack_id

data modify storage slimecore:out build.result.error.multiple_implementations append from storage slimecore:_ x.entry
