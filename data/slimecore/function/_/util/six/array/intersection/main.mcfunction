#> six:api > array/set/intersection
#--------------------
# -> a: obj[]
# -> b: obj[]
# => compare: {only: string[]} | {without: string[]} | {} = {}
#--------------------
# <- shared_a: obj[]
# <- shared_b: obj[]
# <- shared: obj[]
#--------------------
#> gets all objects from <a> and <b> that share the same values for tags specified in <compare>.
#--------------------
#- if <compare>: compares only or without specified tags for each object. (See six:api/object/partial)
#  - >shared_a</>shared_b< contain the original objects from <a>/<b> that have shared tags.
#  - >shared< are the partial objects that only contain the tags specified by <compare>, shared by <a> and <b>
#- if <compare> is unspecified, >shared_a<, >shared_b<, and >shared< are all identical.
#- if the size of <a> and <b> are known, set <a> to the smaller of the two for maximum performance.
#--------------------
# ...
#--------------------

data modify storage slimecore:_ util.intersection.out.shared_a set value []
data modify storage slimecore:_ util.intersection.out.shared_b set value []
data modify storage slimecore:_ util.intersection.out.shared set value []

execute if data storage slimecore:_ util.intersection.in.a[] run function slimecore:_/util/six/array/intersection/each

data remove storage slimecore:_ util.intersection.in
data remove storage slimecore:_ util.intersection.var
