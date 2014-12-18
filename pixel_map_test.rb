require "minitest/autorun"
require "minitest/pride"
require "./pixel_map"

class TestPixelMap < Minitest::Test
  
  def setup
    @map = PixelMap.new 4, 4
  end

  def test_set
    @map.set 2, 2, "J"
    assert_equal "J", @map.pixels[5] 
  end
  
  def test_get
    @map.set 1, 1, "A"
    assert_equal "A", @map.get(1, 1)
  end
  
  def test_flood4
    @map.clear
    @map.set 1, 1, "A" 
    @map.set 3, 3, "A"     
    @map.set 3, 4, "A"         
    @map.set 4, 3, "A"         
    @map.flood4 2, 2, "B"
    assert_equal %W(
      A B B B
      B B B B
      B B A A
      B B A O
    ), @map.pixels
  end
        
end