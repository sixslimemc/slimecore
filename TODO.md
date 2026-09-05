
- validate pack refs in manifests (e.g. entrypoint 'before'/'after' must be included in dependencies and reference valid entrypoints)
- rename contracts to 'contracts'. this is just way more clear. (e.g 'contract_declarations' & 'contracts_satisfied').

# BUGS
- packs that are disabled during a rebuild lose their path in {data -> world.installed}.

# MAYBE
- add 'enable' slimecore tag