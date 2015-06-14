module OkNokBattleships
  class GridMaker
    def initialize(player)
      @player = player
      @grid = Grid.new
    end
    
    def make_grid
      ask_player_to_place "Aircraft Carrier", 5
      ask_player_to_place "Battleship", 4
      ask_player_to_place "Cruiser", 3
      ask_player_to_place "First Destroyer", 2      
      ask_player_to_place "Second Destroyer", 2
      ask_player_to_place "First Submarine", 1      
      ask_player_to_place "Second Submarine", 1
    end
    
    private
    
    def ask_player_to_place(ship_name, ship_length, error_count=0)
      ship_location = @player.request_ship_location(ship_name, ship_length)
      @grid.place_ship(ship_name, ship_location, ship_length).nok do |error|
        @player.send_warning error
        if error_count < 10
          ask_player_to_place(ship_name, ship_length, error_count + 1)
        else
          @player.fail_out
        end
      end
    end
  end
end