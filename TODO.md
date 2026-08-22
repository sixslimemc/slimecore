
- maybe consider adding an 'enable' tag?

# BUGS
- cannot uninstall packs that are already disabled
    - perhaps related to the fact that 'in_uninstalls/each.1' uses {_ -> data.manifest_packs}, and perhaps enabling datapacks in the same tick as collecting manifests doesnt actually work.