# encoding: UTF-8

module Graph
  
  PositiveInfinity = +1.0/0.0
  NegativeInfinity = -1.0/0.0
  UNDEFINED = "UNDEFINED"
  
  class Base

    def initialize
      @vertices =  Hash.new { |k, v| k[v] = {} } # @vertices of graph like {"1"=>{"2"=>7, "3"=>9, "6"=>14}, "2"=>{"1"=>7, "3"=>10, "4"=>15}, "3"=>{"1"=>9, "2"=>10, "4"=>11, "6"=>2}, "6"=>{"1"=>14, "3"=>2, "5"=>9}, "4"=>{"2"=>15, "3"=>11, "5"=>6}, "5"=>{"4"=>6, "6"=>9}}
      @nodes = Array.new
    end

    def add_edge(source, target, weight)
      raise("Weight is not positive.") if weight < 0
      @vertices[source][target] = weight
      @vertices[target][source] = weight # non directed graph
      @nodes << source << target
      @nodes.uniq!
    end

    # Input source vertex
    # Output min dist of source to each node hash and a hash populated with a pointer to the "next-hop" node on the source graph to get the shortest route to the source
    #
    # http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
    # In the following algorithm, the code u ← vertex in Q with min dist[u], searches for the vertex u in the vertex set Q that has the least dist[u] value.
    # length(u, v) returns the length of the edge joining (i.e. the distance between) the two neighbor-nodes u and v.
    # The variable alt is the length of the path from the root node to the neighbor node v if it were to go through u.
    # If this path is shorter than the current shortest path recorded for v, that current path is replaced with this alt path.
    # The previous array is populated with a pointer to the "next-hop" node on the source graph to get the shortest route to the source.
    def dijkstra(source)
      dist = {}
      prev = {}
      dist[source] = 0                       # Distance from source to source
      prev[source] = UNDEFINED               # Previous node in optimal path initialization

      unvisited_nodes = []
      @nodes.each do |v|    # Initialization
        if v != source            # Where v has not yet been removed from Q (unvisited nodes)
          dist[v] = PositiveInfinity     # Unknown distance function from source to v
          prev[v] = UNDEFINED            # Previous node in optimal path from source
        end
        unvisited_nodes << v                     # All nodes initially in Q (unvisited nodes)
      end

      while !unvisited_nodes.empty?
        # u ← vertex in Q with min dist[u]
        u = dist.select{|k,v| unvisited_nodes.include?(k)}.min_by{|k,v| v}.first  # Source node in first case
        break if (dist[u] == PositiveInfinity)
        unvisited_nodes.delete(u)

        # for each neighbor v of u:           # where v has not yet been removed from Q.
        neighbor_v_of(u).each do |v|
          alt = dist[u] + length(u, v)
          if alt < dist[v]               # A shorter path to v has been found
            dist[v] = alt
            prev[v] = u
          end
        end
      end

      return dist, prev
    end

    def neighbor_v_of(u)
      @vertices[u].keys
    end

    def length(u, v)
      @vertices[u][v]
    end 

  end

end
