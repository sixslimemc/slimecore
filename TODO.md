
- make datapack path resolution way better

- make last-rebuild remembering smarter (apply to explicit rebuilds)

- remove safe mode

- add slimecore version requirement to pack manifests

- enforce the following standard datapack name formats:
    - `<author_id>.<pack_id>.<major>.<minor>.<patch>`
    - `<author_id>.<pack_id>.<major>.<minor>.<patch>.zip`
    - `<author_id>.<pack_id>`
    - `<author_id>.<pack_id>.zip`
    - `<pack_id>`
