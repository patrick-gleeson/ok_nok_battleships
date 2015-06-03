require 'spec_helper'

module OkNokBattleships
  describe Ui do
    
    before(:each) do
      @input = double('input').as_null_object
      @output = double('output').as_null_object
      @quitter = double('quitter').as_null_object
      @ui = Ui.new(@input, @output, @quitter)
    end
    
    describe "#welcome" do
      it "displays a welcome message" do
        expect(@output).to receive(:puts).with("Welcome to OkNokBattleships!")        
        @ui.welcome
      end
      
    end
    
    describe "#request_name" do
      
      it "asks for the user's name" do
        expect(@output).to receive(:puts).with("What is your name?")
        expect(@input).to receive(:gets)        
        @ui.request_name
      end
      
      it "greets the user by name" do
        expect(@input).to receive(:gets).and_return("Joe")
        expect(@output).to receive(:puts).with("Hi Joe!")        
        @ui.request_name
      end
      
      it "exits if user types 'exit'" do
        expect(@input).to receive(:gets).and_return("exit")
        expect(@output).to receive(:puts).with("Bye!")
        expect(@quitter).to receive(:quit)        
        @ui.request_name
      end
      
      it "exits if user types 'quit'" do
        expect(@input).to receive(:gets).and_return("quit")
        expect(@output).to receive(:puts).with("Bye!")
        expect(@quitter).to receive(:quit)
        
        @ui.request_name
      end
    end
  end
end
