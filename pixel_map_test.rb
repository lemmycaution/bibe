require "minitest/autorun"
require "minitest/pride"
require "./pixel_map"

class TestPixelMap < Minitest::Test
  
  def setup
    @map = PixelMap.new 4, 4
  end

  def test_pixels
    @map.clear
    assert_equal %W(
      O O O O
      O O O O
      O O O O
      O O O O    
    ), @map.pixels
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
    
    @map.flood4 2, 2, "B"
    assert_equal %W(
      B B B B
      B B B B
      B B B B
      B B B B
    ), @map.pixels
  end
  
  def test_flood4_with_border
    @map.clear
    @map.set 1, 1, "A" 
    @map.set 3, 3, "A"     
    @map.set 3, 4, "A"         
    @map.set 4, 3, "A"    
    assert_equal %W(
      A O O O
      O O O O
      O O A A
      O O A O
    ), @map.pixels
         
    @map.flood4 2, 2, "B"
    assert_equal %W(
      A B B B
      B B B B
      B B A A
      B B A O
    ), @map.pixels
  end
  
  def test_line_horizontal
    @map.clear
    @map.line 1, 1, 4, 1, "L"
    assert_equal %W(
      L L L L    
      O O O O
      O O O O
      O O O O
    ), @map.pixels
  end
  
  def test_line_vertical
    @map.clear
    @map.line 2, 1, 2, 4, "L"
    assert_equal %W(
      O L O O    
      O L O O
      O L O O
      O L O O
    ), @map.pixels
  end  
  
  def test_line_diagonal
    @map.clear
    @map.line 1, 1, 4, 4, "L"
    assert_equal %W(
      L O O O    
      O L O O
      O O L O
      O O O L
    ), @map.pixels
  end
        
end