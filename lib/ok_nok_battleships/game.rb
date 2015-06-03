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
    end
    
    def construct_player_grid      
    end
    
    def run_game_loop      
    end
  end
end
