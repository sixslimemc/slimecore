
data modify storage slimecore:in relative_order.input set value 'bruh'
function slimecore:evaluate/component/relative_order
tellraw @a ["rel fail: ", {'storage':'slimecore:out', 'nbt':'relative_order'}]

data modify storage slimecore:in load_ordering.input set value {load:1b, tick:'bruh'}
function slimecore:evaluate/component/load_ordering
tellraw @a ["order fail: ", {'storage':'slimecore:out', 'nbt':'load_ordering'}]

data modify storage slimecore:in version.value set value {major:1, minor: 'bruh', patch:3}
function slimecore:validate/component/version
tellraw @a ["version fail: ", {'storage':'slimecore:out', 'nbt':'version'}]

data modify storage slimecore:in version.value set value {major:1, minor: 4, patch:3}
function slimecore:validate/component/version
tellraw @a ["version pass: ", {'storage':'slimecore:out', 'nbt':'version'}]

data modify storage slimecore:in pack_reference.input set value 'test-o'
function slimecore:evaluate/component/pack_reference
tellraw @a ["packref pass: ", {'storage':'slimecore:out', 'nbt':'pack_reference'}]
