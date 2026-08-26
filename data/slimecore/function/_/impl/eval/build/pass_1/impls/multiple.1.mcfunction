# IMPL > slimecore:eval/build
# pass_1/impls/multiple.1

data modify storage slimecore:_ x.entry set value {contract:{}, satisfiers:[{}]}
data modify storage slimecore:_ x.entry.contract set from storage slimecore:_ v.build.this_impl
data modify storage slimecore:_ x.entry.satisfiers[0].pack_ref set from storage slimecore:_ v.build.seen_impl.pack_id

data modify storage slimecore:out build.result.error.oversatisfied_contracts append from storage slimecore:_ x.entry
