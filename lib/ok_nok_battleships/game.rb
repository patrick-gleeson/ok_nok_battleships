module OkNokBattleships
  class Game
    def initialize(input, output, quitter)
      @ui = Ui.new input, output, quitter
      @ai = Ai.new
      @player_grid = Grid.new
      @ai_grid = Grid.new
    end
    
    def begin
      @ui.welcome
      @ui.request_name      
    end
  end
end
