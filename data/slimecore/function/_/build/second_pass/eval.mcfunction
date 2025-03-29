#> slimecore:_/build/second_pass/eval
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ build.deproot set from storage slimecore:_ build.depstack[-1]

# 'build.deps' includes deps and sups
data modify storage slimecore:_ build.deps set from storage slimecore:_ build.deproot.dependencies
data modify storage slimecore:_ build.deps append from storage slimecore:_ build.deproot.supports[]

data remove storage slimecore:_ build.depstack[-1]