require 'spec_helper'

module OkNokBattleships
  describe Game do
    
    before(:each) do
      @input = double('input').as_null_object
      @output = double('output').as_null_object
      @quitter = double('quitter').as_null_object
      @game = Game.new(@input, @output, @quitter)
    end
    
    describe "#begin" do
      it "displays a welcome message" do
        expect(@output).to receive(:puts).with("Welcome to OkNokBattleships!")
        
        @game.begin
      end
      
      it "asks for the user's name" do
        expect(@output).to receive(:puts).with("What is your name?")
        expect(@input).to receive(:gets)
        
        @game.begin
      end
      
      it "greets the user by name" do
        expect(@input).to receive(:gets).and_return("Joe")
        expect(@output).to receive(:puts).with("Hi Joe!")
        
        @game.begin
      end
      
      it "exits if user types 'exit'" do
        expect(@input).to receive(:gets).and_return("exit")
        expect(@output).to receive(:puts).with("Bye!")
        expect(@quitter).to receive(:quit)
        
        @game.begin
      end
      
      it "exits if user types 'quit'" do
        expect(@input).to receive(:gets).and_return("quit")
        expect(@output).to receive(:puts).with("Bye!")
        expect(@quitter).to receive(:quit)
        
        @game.begin
      end
    end
  end
end
