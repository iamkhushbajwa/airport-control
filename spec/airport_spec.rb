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
  end
end