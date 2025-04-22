
- hooks

# Libraries
- perhaps make 'library' a boolean field in manifest, indicating whether the pack is a library.
- a LIBRARY is defined as a that has no *observable* behavior on its own. i.e., (excluding latency) a non-op player has *zero* way to differentiate between a world with <A> and a world without <A> if <A> has no installed dependents.