require 'spec_helper'

module OkNokBattleships
  describe GridMaker do
    
    before(:each) do
      @player = double('player').as_null_object
      @grid_maker = GridMaker.new @player
    end
    
    describe "#make_grid" do
      it "requests location for all ships" do
        expect(@player).to receive(:request_ship_location).
                             with("Aircraft Carrier", 5).
                             once.
                             and_return(ShipLocation.new(Point.new(0,0), Orientation.north))       
        expect(@player).to receive(:request_ship_location).
                             with("Battleship", 4).
                             once.
                             and_return(ShipLocation.new(Point.new(1,0), Orientation.north))     
        expect(@player).to receive(:request_ship_location).
                             with("Cruiser", 3).
                             once.
                             and_return(ShipLocation.new(Point.new(2,0), Orientation.north))      
        expect(@player).to receive(:request_ship_location).
                             with("First Destroyer", 2).
                             once.
                             and_return(ShipLocation.new(Point.new(3,0), Orientation.north))      
        expect(@player).to receive(:request_ship_location).
                             with("Second Destroyer", 2).
                             once.
                             and_return(ShipLocation.new(Point.new(4,0), Orientation.north))     
        expect(@player).to receive(:request_ship_location).
                             with("First Submarine", 1).
                             once.
                             and_return(ShipLocation.new(Point.new(5,0), Orientation.north))      
        expect(@player).to receive(:request_ship_location).
                             with("Second Submarine", 1).
                             once.
                             and_return(ShipLocation.new(Point.new(6,0), Orientation.north))              
        @grid_maker.make_grid
      end
      
      #Spec for if player sends bad request, and if player sends too many bad requests      
    end
  end
end
