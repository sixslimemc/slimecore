
data modify storage slimecore:in manifest.pack set value {}

data modify storage slimecore:in manifest.pack.pack_id set value "test_1"
data modify storage slimecore:in manifest.pack.author_id set value "sixslime"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value "TODO"

data modify storage slimecore:in manifest.pack.display.name set value "TODO"
data modify storage slimecore:in manifest.pack.display.summary set value "TODO"
data modify storage slimecore:in manifest.pack.display.author_name set value "SixSlime"

data modify storage slimecore:in manifest.pack.display.links.author set value "https://github.com/sixslimemc"
data modify storage slimecore:in manifest.pack.display.links.info set value "https://github.com/sixslimemc/six"
data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.entrypoints append value {id:"a", id:"b"}
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value []
data modify storage slimecore:in manifest.pack.is_library set value false

function slimecore:api/manifest