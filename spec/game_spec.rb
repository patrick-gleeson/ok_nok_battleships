require 'spec_helper'

module OkNokBattleships
  describe Game do
    
    before(:each) do
      @ui = double('ui').as_null_object
      expect(Ui).to receive(:new).and_return(@ui)
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
    end
  end
end
