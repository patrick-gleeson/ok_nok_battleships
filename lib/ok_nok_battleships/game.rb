module OkNokBattleships
  class Game
    def initialize(input, output)
      @input, @output = input, output
    end
    
    def begin
      @output.puts("Welcome to OkNokBattleships!")
      @output.puts("What is your name?")
      name = @input.gets
      @output.puts("Hi #{name}!")
    end
  end
end
