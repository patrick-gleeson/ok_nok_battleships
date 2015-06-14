require 'spec_helper'

module OkNokBattleships
  describe Orientation do    
    describe ".new" do
      it "accepts 2 parameters" do
        expect { Orientation.new 1,2}.not_to raise_exception
      end      
    end
    
    before(:each) do
      @point = Point.new 0, 0
    end
         
    describe ".north" do      
      before(:each) do
        @orientation = Orientation.north
        @new_point = @orientation.move_to_next_point @point
      end
        
      it "returns an Orientation" do
        expect(@orientation).to be_an(Orientation)
      end
      
      it "returns an Orientation that increments the Y of a point" do
        expect(@new_point.y).to eq 1
      end  
      
      it "returns an Orientation that leaves the X of a point unchanged" do
        expect(@new_point.x).to eq 0
      end        
    end
     
    describe ".east" do      
      before(:each) do
        @orientation = Orientation.east
        @new_point = @orientation.move_to_next_point @point
      end
        
      it "returns an Orientation" do
        expect(@orientation).to be_an(Orientation)
      end
      
      it "returns an Orientation that increments the X of a point" do
        expect(@new_point.x).to eq 1
      end  
      
      it "returns an Orientation that leaves the Y of a point unchanged" do
        expect(@new_point.y).to eq 0
      end        
    end
       
    describe ".south" do      
      before(:each) do
        @orientation = Orientation.south
        @new_point = @orientation.move_to_next_point @point
      end
        
      it "returns an Orientation" do
        expect(@orientation).to be_an(Orientation)
      end
      
      it "returns an Orientation that decrements the Y of a point" do
        expect(@new_point.y).to eq(-1)
      end  
      
      it "returns an Orientation that leaves the X of a point unchanged" do
        expect(@new_point.x).to eq 0
      end        
    end
     
    describe ".west" do      
      before(:each) do
        @orientation = Orientation.west
        @new_point = @orientation.move_to_next_point @point
      end
        
      it "returns an Orientation" do
        expect(@orientation).to be_an(Orientation)
      end
      
      it "returns an Orientation that decrements the X of a point" do
        expect(@new_point.x).to eq(-1)
      end   
      
      it "returns an Orientation that leaves the Y of a point unchanged" do
        expect(@new_point.y).to eq 0
      end       
    end
    
    describe "#move_to_next_point" do
      it "accepts a Point as a parameter" do
        orientation = Orientation.new(1,2)
        expect { orientation.move_to_next_point @point }.not_to raise_exception
      end
      
      it "returns a Point" do
        orientation = Orientation.new(1,2)
        expect(orientation.move_to_next_point @point).to be_a Point
      end
      
      it "increments the point by the values it was initialized with" do
        orientation = Orientation.new(1,2)
        point = Point.new(3,4)
        expected_point = Point.new(4,6)
        returned_point = orientation.move_to_next_point point
        expect(returned_point).to eq expected_point
      end
    end
    
  end
end
