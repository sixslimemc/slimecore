#> slimecore:_/get_manifests
#--------------------
# _/impl/rebuild/process
# _/reload
#--------------------

# --- GET MANIFESTS ---
data modify storage slimecore:_ data.manifest_packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "itemd"
data modify storage slimecore:in manifest.pack.author_id set value "test"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value ""

data modify storage slimecore:in manifest.pack.display.name set value "___"
data modify storage slimecore:in manifest.pack.display.summary set value "___"
data modify storage slimecore:in manifest.pack.display.author_name set value "___"

data modify storage slimecore:in manifest.pack.display.links.author set value "___"
data modify storage slimecore:in manifest.pack.display.links.info set value "___"
data modify storage slimecore:in manifest.pack.display.links.versions set value "___"

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value []

data modify storage slimecore:in manifest.pack.is_library set value false

execute if score inject test matches 1 run function slimecore:api/manifest
data remove storage slimecore:in manifest.pack

data remove storage slimecore:in manifest.pack

data modify storage slimecore:in manifest.pack.pack_id set value "six"
data modify storage slimecore:in manifest.pack.author_id set value "test"
data modify storage slimecore:in manifest.pack.version set value {major:0, minor:1, patch:0}
data modify storage slimecore:in manifest.pack.url set value ""

data modify storage slimecore:in manifest.pack.display.name set value "___"
data modify storage slimecore:in manifest.pack.display.summary set value "___"
data modify storage slimecore:in manifest.pack.display.author_name set value "___"

data modify storage slimecore:in manifest.pack.display.links.author set value "___"
data modify storage slimecore:in manifest.pack.display.links.info set value "___"
data modify storage slimecore:in manifest.pack.display.links.versions set value "___"

data modify storage slimecore:in manifest.pack.entrypoints set value []
data modify storage slimecore:in manifest.pack.preload_entrypoints set value []
data modify storage slimecore:in manifest.pack.abstract_declarations set value []
data modify storage slimecore:in manifest.pack.abstract_implementations set value []
data modify storage slimecore:in manifest.pack.dependencies set value []

data modify storage slimecore:in manifest.pack.is_library set value false

execute if score inject test matches 2 run function slimecore:api/manifest
data remove storage slimecore:in manifest.pack

scoreboard players reset *manifest_time _slimecore
# ---