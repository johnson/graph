require 'test_helper'
require 'graph/base'


class TestBase < Test::Unit::TestCase

  def setup
    @gr = Graph::Base.new
    @gr.add_edge("1", "2", 7)
    @gr.add_edge("1", "3", 9)
    @gr.add_edge("1", "6", 14)
    @gr.add_edge("2", "3", 10)
    @gr.add_edge("2", "4", 15)
    @gr.add_edge("3", "4", 11)
    @gr.add_edge("3", "6", 2)
    @gr.add_edge("4", "5", 6)
    @gr.add_edge("5", "6", 9)    
  end
  
  def test_add_edge
    expected_hash = {"1"=>{"2"=>7, "3"=>9, "6"=>14}, "2"=>{"1"=>7, "3"=>10, "4"=>15}, "3"=>{"1"=>9, "2"=>10, "4"=>11, "6"=>2}, "6"=>{"1"=>14, "3"=>2, "5"=>9}, "4"=>{"2"=>15, "3"=>11, "5"=>6}, "5"=>{"4"=>6, "6"=>9}}
    assert_equal expected_hash,  @gr.instance_variable_get(:"@vertices")
  end
  
  def test_length_of_u_v
    assert_equal 7,  @gr.length("1", "2")
    assert_equal 9,  @gr.length("1", "3")
    assert_equal 14, @gr.length("1", "6")
    assert_equal 10, @gr.length("2", "3")
    assert_equal 15, @gr.length("2", "4")
    assert_equal 11, @gr.length("3", "4")
    assert_equal 2,  @gr.length("3", "6")
    assert_equal 6,  @gr.length("4", "5")
    assert_equal 9,  @gr.length("5", "6")      
  end
  
  def test_neighbor_v_of_u
    assert_equal ["2", "3", "6"].sort,       @gr.neighbor_v_of("1").sort
    assert_equal ["1", "3", "4"].sort,       @gr.neighbor_v_of("2").sort
    assert_equal ["1", "2", "4", "6"].sort,  @gr.neighbor_v_of("3").sort
    assert_equal ["2", "3", "5"].sort,       @gr.neighbor_v_of("4").sort
    assert_equal ["4", "6" ].sort,           @gr.neighbor_v_of("5").sort 
    assert_equal ["1", "3", "5"].sort,       @gr.neighbor_v_of("6").sort    
  end
  
  def test_dijkstra_shortest_path
    dist, prev = @gr.dijkstra("1")
    expected_dist = {"1"=>0, "2"=>7, "3"=>9, "6"=>11, "4"=>20, "5"=>20}
    expected_prev = {"1"=> "UNDEFINED", "2"=>"1", "3"=>"1", "6"=>"3", "4"=>"3", "5"=>"6"}
    assert_equal expected_dist, dist
    assert_equal expected_prev, prev
  end

  
end