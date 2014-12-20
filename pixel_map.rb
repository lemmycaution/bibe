class PixelMap
  
  WHITE = "O"
  
  attr_reader :pixels
  
  def initialize width, height
    @width = width
    @height = height
    @pixels = Array.new( width * height, WHITE)
  end
  
  # sets color of a pixel
  def set x, y, color
    @pixels[pixel(x,y)] = color
  end
  
  # gets color of a pixel
  def get x, y
    @pixels[pixel(x,y)]
  end
  
  # 4 way stack based flood fill
  # see http://en.wikipedia.org/wiki/Flood_fill#Stack-based_recursive_implementation_.28Four-way.29
  
  # wondering about how can bitwise operations improve this ?!?
  def flood4 x, y, new_color, old_color = nil
    color = get(x,y)
    old_color ||= color
    return if x < 1 || y < 1 || x > @width || y > @height || color == new_color || color != old_color

    set x, y, new_color
		flood4 x+1, y, new_color, old_color
		flood4 x-1, y, new_color, old_color
		flood4 x, y+1, new_color, old_color
		flood4 x, y-1, new_color, old_color
  end
  
  # http://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
  # Implementation forked from Coffee Script port on 
  # http://rosettacode.org/wiki/Bitmap/Bresenham%27s_line_algorithm#CoffeeScript
  
  def line x0, y0, x1, y1, c
    dx = (x1 - x0).abs
    sx = x0 < x1 ? 1 : -1
    dy = (y1 - y0).abs
    sy = y0 < y1 ? 1 : -1
    err = (dx > dy ? dx : -dy) / 2
    
    loop do
      set x0, y0, c
      break if x0 === x1 && y0 === y1
      e2 = err
      if e2 > -dx
        err -= dy
        x0 += sx
      end  
      if e2 < dy
        err += dx
        y0 += sy  
      end
    end 
  end 
  
  # reset pixels array to all WHITE
  def clear
    @pixels.fill WHITE
  end
  
  # pretty print pixel array
  def show
    @pixels.each_slice(@height) { |row| puts row.join(",") + "\n" }
  end
  
  private
  
  def pixel x, y
    # modified version of x + y * width
    # for easy usage of 1,1 coordinates
    
    (x-1) + (y-1) * @width
  end
  
  
end