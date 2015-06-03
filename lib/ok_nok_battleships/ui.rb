module OkNokBattleships
  class Ui
    EXIT_MESSAGES = ["quit", "exit"]
    
    def initialize(input, output, quitter)
      @input, @output, @quitter = input, output, quitter
    end
    
    def welcome
       @output.puts("Welcome to OkNokBattleships!")
    end
    
    def request_name
      @output.puts("What is your name?")
      @name = get_input_or_exit
      @output.puts("Hi #{@name}!")
    end
    
    private
    
    def get_input_or_exit
      input = @input.gets.chomp
      if EXIT_MESSAGES.include? input
        @output.puts("Bye!")
        @quitter.quit
      end
      input
    end
    
  end
end