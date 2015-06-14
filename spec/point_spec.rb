require 'spec_helper'

module OkNokBattleships
  describe Point do 
    before(:each) do
      @point = Point.new "first parameter", "second parameter"
    end
       
    describe ".new" do
      it "accepts 2 parameters" do
        expect { Point.new 1,2}.not_to raise_exception
      end      
    end
    
    describe "#x" do      
      it "returns the first parameter it was initialized with" do
        expect(@point.x).to eq "first parameter"
      end
    end
    
    describe "#y" do      
      it "returns the second parameter it was initialized with" do
        expect(@point.y).to eq "second parameter"
      end
    end
    
    describe "#==" do
      it "equals itself" do
        expect(@point == @point).to be true
      end
      
      it "equals another point initialized with the same x and y" do
        expect(@point == Point.new("first parameter", "second parameter")).to be true
      end
      
      it "doesn't equal another point with a different x" do
        expect(@point == Point.new("unusual parameter", "second parameter")).to be false
      end
      
      it "doesn't equal another point with a different y" do
        expect(@point == Point.new("first parameter", "unusual parameter")).to be false
      end
      
      it "doesn't equal another point with a different x and y" do
        expect(@point == Point.new("unusual parameter", "unusual parameter")).to be false
      end
    end
  end
end
