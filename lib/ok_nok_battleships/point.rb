module OkNokBattleships
  class Point
    attr_reader :x, :y
    def initialize(x, y)
      @x, @y = x, y
    end
    
    def ==(point)
      point.x == @x && point.y == @y
    end
  end
end