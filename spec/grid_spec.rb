require 'spec_helper'

module OkNokBattleships
  describe Grid do
    
    let(:grid) { Grid.new }
    let(:default_location) { ShipLocation.new(Point.new(0,0), Orientation::north) }
    
    describe "#place_ship" do
      it "returns an ok_nok" do
        ret = grid.place_ship("Battleship", default_location, 5)
        expect(ret).to be_an(OkNok)
      end
      
      illegal_coords = [[-1,5],[-1,-1],[-1, 10],[5,-15],[5,10],[23,-7],[23,4],[23,65]]
      
      illegal_coords.each do |coords|
        it "noks if start point is at #{coords[0]},#{coords[1]}" do
          point = Point.new coords[0], coords[1]
          illegal_location = ShipLocation.new(point, Orientation::north)
          ret = grid.place_ship("Battleship", illegal_location, 1)
          expect(ret).to be_nok
        end
      end
      
      legal_coords = [[0,0],[3,0],[9,0],[4,0],[7,6],[3,9],[9,0],[9,2],[9,9]]
      
      legal_coords.each do |coords|
        it "oks if start point is at #{coords[0]},#{coords[1]}" do
          point = Point.new coords[0], coords[1]
          legal_location = ShipLocation.new(point, Orientation::north)
          ret = grid.place_ship("Battleship", legal_location, 1)
          expect(ret).to be_ok
        end
      end
      
      go_out_of_bounders = [
                              [[0,0], 2, Orientation::south],
                              [[0,0], 2, Orientation::west ],
                              [[5,5], 6, Orientation::north],
                              [[5,5], 7, Orientation::south],
                              [[9,3], 2, Orientation::east],
                              [[0,9], 11, Orientation::east],
                              [[9,4], 7, Orientation::north],
                              [[8,4], 10, Orientation::west],
                           ]
      go_out_of_bounders.each do |details|
        it "noks if it goes out of bounds" do
          point = Point.new details[0][0], details[0][1]
          location = ShipLocation.new(point, details[2])
          ret = grid.place_ship("Battleship", location, details[1])
          expect(ret).to be_nok
        end
      end
      
      stay_in_bounders = [
                           [[0,0], 1, Orientation::south],
                           [[0,0], 1, Orientation::west ],
                           [[5,5], 5, Orientation::north],
                           [[5,5], 6, Orientation::south],
                           [[9,3], 1, Orientation::east],
                           [[0,9], 10, Orientation::east],
                           [[9,4], 6, Orientation::north],
                           [[8,4], 9, Orientation::west],
                         ]
                           
      stay_in_bounders.each do |details|
        it "oks if it stays in bounds" do
          point = Point.new details[0][0], details[0][1]
          location = ShipLocation.new(point, details[2])
          ret = grid.place_ship("Battleship", location, details[1])
          expect(ret).to be_ok
        end
      end
      
      overlapping_pairs = [
                            [
                              [[0,0], 1, Orientation::north],
                              [[0,0], 1, Orientation::north]
                            ],
                            [
                              [[0,0], 2, Orientation::north],
                              [[0,1], 1, Orientation::north]
                            ],
                            [
                              [[0,0], 4, Orientation::north],
                              [[0,2], 4, Orientation::north]
                            ],
                            [
                              [[3,3], 3, Orientation::east],
                              [[5,5], 4, Orientation::south]
                            ],
                            [
                              [[3,3], 2, Orientation::east],
                              [[4,3], 4, Orientation::north]
                            ],
                          ]
                          
      overlapping_pairs.each do |pair|
        it "noks if two ships overlap" do
          point1 = Point.new pair[0][0][0], pair[0][0][1]
          location1 = ShipLocation.new(point1, pair[0][2])
          grid.place_ship("Battleship", location1, pair[0][1])
          point2 = Point.new pair[1][0][0], pair[1][0][1]
          location2 = ShipLocation.new(point2, pair[1][2])
          ret = grid.place_ship("Battleship", location2, pair[1][1])
          expect(ret).to be_nok
        end
      end
      
      non_overlapping_pairs = [
                                [
                                  [[0,0], 1, Orientation::north],
                                  [[0,1], 1, Orientation::north]
                                ],
                                [
                                  [[0,0], 2, Orientation::north],
                                  [[1,1], 1, Orientation::north]
                                ],
                                [
                                  [[0,0], 4, Orientation::north],
                                  [[9,2], 4, Orientation::north]
                                ],
                                [
                                  [[3,3], 2, Orientation::east],
                                  [[6,5], 4, Orientation::south]
                                ],
                                [
                                  [[3,3], 2, Orientation::east],
                                  [[4,4], 4, Orientation::north]
                                ],
                              ]
                          
      non_overlapping_pairs.each do |pair|
        it "oks if two ships don't overlap" do
          point1 = Point.new pair[0][0][0], pair[0][0][1]
          location1 = ShipLocation.new(point1, pair[0][2])
          grid.place_ship("Battleship", location1, pair[0][1])
          point2 = Point.new pair[1][0][0], pair[1][0][1]
          location2 = ShipLocation.new(point2, pair[1][2])
          ret = grid.place_ship("Battleship", location2, pair[1][1])
          expect(ret).to be_ok
        end
      end
    end
  end
end
