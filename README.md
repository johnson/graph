# Graph

Graph is a simple implement of show Dijkstra's algorithm in ruby follow http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm to show the power of ruby looks like pseudocode, readable and maintain-able and test-able.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graph', github: 'johnson/graph'
```

And then execute:

    $ bundle

## Dev

    $ git clone http://github.com/johnson/graph.git
    $ cd graph
    $ rake test


## Usage


    @gr = Graph::Base.new
    @gr.add_edge("1","2",7)
    @gr.add_edge("1","3",9)
    @gr.add_edge("1","6",14)
    @gr.add_edge("2","3",10)
    @gr.add_edge("2","4",15)
    @gr.add_edge("3","4",11)
    @gr.add_edge("3","6",2)
    @gr.add_edge("4","5",6)
    @gr.add_edge("5","6",9)

    dist, prev = @gr.dijkstra("1")
    
    puts dist.inspect
    puts prev.inspect  
  
## Contributing

1. Fork it ( https://github.com/johnson/graph/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
