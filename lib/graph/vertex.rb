# encoding: UTF-8

## TODO use Vertex class in Graph::Base
# class Vertex
#
#   attr_accessor :name, :edges
#
#   def initialize(name, *edges)
#     @name = name
#     @edges ||= Hash.new
#     edges.each { |edge| @edges << edge }
#   end
#
#   def eql?(edge)
#     (self.source == edge.source) && (self.target == edge.target) && (self.weight == edge.weight)
#   end
#   alias == eql?
#
# end