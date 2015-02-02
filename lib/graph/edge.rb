# encoding: UTF-8

## TODO use Edge class in Graph::Base
# Edge = Struct.new(:source, :target, :weight) do
#
#   def positive?
#     raise("Weight is not positive.") if self.weight < 0
#     self
#   end
#
#   def eql?(edge)
#     (self.source == edge.source) && (self.target == edge.target) && (self.weight == edge.weight)
#   end
#   alias == eql?
#
# end