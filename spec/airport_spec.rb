require_relative "../lib/airport"

describe Airport do

  context "Traffic control" do
    it "can have capacity" do
      airport = Airport.new
      expect(airport.capacity).to eq(100)
    end

    it "can set capacity" do
      airport_two = Airport.new({:capacity => 50})
      expect(airport_two.capacity).to eq(50)
    end

    it "can park planes" do
      airport = Airport.new
      plane = double :plane
      airport.park(plane)
      expect(airport.planes).to eq([plane])
    end

  end
end