# IMPL > slimecore:eval/build
# entrypoint_order/do
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.build.error_involved set value []
execute if data storage slimecore:_ v.build.entrypoint_order.in.initial[0] run function slimecore:_/impl/eval/build/entrypoint_order/do
