module OkNokBattleships
  class Game
    def initialize(input, output, quitter)
      @ui = Ui.new input, output, quitter
      @ai = Ai.new
    end
    
    def begin
      @ui.welcome
      @ui.request_name
      
      construct_computer_grid
      construct_player_grid 
      run_game_loop        
    end
    
    def construct_computer_grid 
      @ui.notify_computer_grid_construction_starting
      computer_grid_maker = GridMaker.new(@ai)
      @computer_grid = computer_grid_maker.make_grid
      @ui.notify_computer_grid_construction_complete
    end
    
    def construct_player_grid 
    end
    
    def run_game_loop      
    end
  end
end
