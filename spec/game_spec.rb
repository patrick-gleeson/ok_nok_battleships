require 'spec_helper'

module OkNokBattleships
  describe Game do
    
    before(:each) do
      @ui = double('ui').as_null_object
      expect(Ui).to receive(:new).and_return(@ui)
      @ai = double('ai').as_null_object
      expect(Ai).to receive(:new).and_return(@ai)
      @game = Game.new(nil, nil, nil)
    end
    
    describe "#begin" do
      it "displays a welcome message" do
        expect(@ui).to receive(:welcome)   
        @game.begin
      end
      
      it "asks for the user's name" do
        expect(@ui).to receive(:request_name)
        @game.begin
      end
      
      it "starts constructing the computer grid" do
        expect(@game).to receive(:construct_computer_grid)
        @game.begin
      end
    end
    
    describe "#construct_computer_grid" do      
      it "notifies the user it's starting" do
        expect(@ui).to receive(:notify_computer_grid_construction_starting)
        @game.construct_computer_grid
      end
            
      it "builds a grid" do
        expect(Grid).to receive(:new)
        @game.construct_computer_grid
      end   
        
      it "notifies the user it's finished" do
        expect(@ui).to receive(:notify_computer_grid_construction_complete)
        @game.construct_computer_grid
      end
    end
  end
end
