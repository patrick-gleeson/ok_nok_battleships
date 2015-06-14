module OkNokBattleships
  class Orientation
    
    class << self
      
      def north
        Orientation.new(0,1)
      end
      
      def east
        Orientation.new(1,0)
      end
      
      def south
        Orientation.new(0,-1)
      end
      
      def west
        Orientation.new(-1,0)
      end
    end
    
    def initialize(x_shift, y_shift)
      @x_shift, @y_shift = x_shift, y_shift
    end
    
    def move_to_next_point(current_point)
      Point.new(current_point.x + @x_shift, current_point.y + @y_shift)
    end
    
    def ==(orientation)
      test_point = Point.new 0,0
      move_to_next_point(test_point) == orientation.move_to_next_point(test_point)      
    end
  end
end