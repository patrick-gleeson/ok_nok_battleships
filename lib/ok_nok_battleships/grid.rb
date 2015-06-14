module OkNokBattleships
  class Grid
    GUESS = "guess"
    HIT = "hit"
    
    Ship = Struct.new :name, :remaining
    
    def initialize
      @coordinates = []
      10.times do
        @coordinates << []
      end
    end
    
    def place_ship(name, location, length)
      ship = Ship.new name, length
      catch(:exit_recursion) do
        place_ship_points ship, location.point, location.orientation, length - 1
      end
    end
    
    private
    
    def place_ship_points(ship, point, orientation, additional_points)
      place_ship_point(point, ship).nok {|error|throw :exit_recursion, nok(error)}.ok do |message|
        if additional_points == 0
          ok "Ship added"
        else
          new_point = orientation.move_to_next_point point
          place_ship_points(ship, new_point, orientation, additional_points - 1)
        end
      end
    end
    
    def place_ship_point(point, ship)
      return nok "Ship went out of bounds!" unless point.x >= 0 && point.x < 10 && point.y >= 0 && point.y < 10
      return nok "Grid square occupied" if @coordinates[point.x][point.y]
      
      @coordinates[point.x][point.y] = ship
      ok "Point added"
    end
  end
end