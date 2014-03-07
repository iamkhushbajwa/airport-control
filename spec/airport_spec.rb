require_relative "../lib/airport"

describe Airport do
  context "Traffic control" do
    it "can have capacity" do
      airport = Airport.new
      expect(airport.capacity).to eq(100)
    end
  end
end