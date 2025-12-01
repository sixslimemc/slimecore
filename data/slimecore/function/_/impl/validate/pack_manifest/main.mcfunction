# IMPL > slimecore:validate/pack_manifest
# main

data modify storage slimecore:_/in ensure_keys.keys set value ['pack_id', 'author', 'version', 'version', 'version.patch', 'display', 'entrypoints', 'preload_entrypoints', 'is_library', 'abstract_declarations', 'abstract_implementations', 'dependencies']
data modify storage slimecore:_/in ensure_keys.value set from storage slimecore:in pack_manifest.pack
function slimecore:_/util/ensure_keys/main
