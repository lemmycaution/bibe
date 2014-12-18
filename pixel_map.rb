class PixelMap
  
  WHITE = "O"
  
  attr_reader :pixels
  
  def initialize width, height
    @width = width
    @height = height
    @pixels = Array.new( width * height, WHITE)
  end
  
  def set x, y, color
    @pixels[pixel(x,y)] = color
  end
  
  def get x, y
    @pixels[pixel(x,y)]
  end
  
  def flood4 x, y, c, source = nil
    source ||= get(x,y)
    target = pixel(x,y)
    if @pixels[target] === source
      @pixels[target] = c
      
  		flood4(x+1,y,c,source)
  		flood4(x-1,y,c,source)
  		flood4(x,y+1,c,source)
  		flood4(x,y-1,c,source)
    end
  end
  
  def clear
    @pixels.fill WHITE
  end
  
  # pretty prints pixel array
  def print
    @pixels.each_slice(@height) { |row| puts row.join(",") + "\n" }
  end
  
  private
  
  def pixel x, y
    # modified version of x + y * width
    # for easy usage of 1,1 coordinates
    (x-1) + (y-1) * @width
  end
  
  
end