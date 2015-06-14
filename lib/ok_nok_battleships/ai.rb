module OkNokBattleships
  class Ai
    
    def initialize
      @random = Random.new
    end
    
    def request_ship_location(ship_name, ship_length)
      point = Point.new(get_random_coordinate, get_random_coordinate)
      orientation = get_random_orientation
      ShipLocation.new(point, orientation)
    end
    
    def send_warning(_)
      # NO OP
    end
    
    def fail_out
      raise "Something went so wrong I'm raising an exception!"
    end
    
    private
    
    def get_random_coordinate
      @random.rand(10)      
    end
    
    def get_random_orientation
      direction = @random.rand(4)
      case direction
      when 0
        Orientation.north
      when 1
        Orientation.east
      when 2
        Orientation.south
      when 3
        Orientation.west
      end
    end
    
  end
end