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
    
    def notify_computer_grid_construction_starting
      @output.puts("Creating computer grid...")
    end
    
    def notify_computer_grid_construction_complete
      @output.puts("Computer grid created!")
    end
    
    def request_ship_location(ship_name, ship_length)
      space_word = (ship_length == 1) ? "space" : "spaces"
      @output.puts("Please enter a location for your #{ship_name} (#{ship_length} #{space_word} long)")
      point = request_point
      orientation = request_orientation
      ShipLocation.new point, orientation
    end
    
    def send_warning(message)
      @output.puts("Uh-oh! #{message}")
    end
    
    def fail_out
      @output.puts "Something went so wrong I'm giving up!"
      @quitter.quit
    end
    
    private
    
    def request_point
      @output.puts("Pick a grid point between A1 and J10")
      get_point.value_or_if_nok do |error|
        send_warning error
        request_point
      end
    end
    
    def request_orientation
      @output.puts("Pick am orientation - either N, E, S, or W")
      get_orientation.value_or_if_nok do |error|
        send_warning error
        request_orientation
      end
    end
    
    def get_point
      input = get_input_or_exit
      if (match_data = /\A([A-Ja-j])([1-9]|10)\z/.match input)
        x = "abcdefghij".index match_data[1].downcase
        y = match_data[2].to_i
        ok Point.new(x, y)
      else
        nok "Couldn't recognise that as a grid point!"
      end
    end
    
    def get_orientation
      input = get_input_or_exit
      if (match_data = /\A(N|E|S|W)\z/.match input)
        case match_data[1]
        when "N"
          ok Orientation.north
        when "E"
          ok Orientation.east
        when "S"
          ok Orientation.south
        when "W"
          ok Orientation.west
        end
      else
        nok "Couldn't recognise that as an orientation!"
      end
    end
    
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