require_relative "../lib/airport"

describe Airport do

  context "Traffic control" do
    let(:airport){Airport.new}

    def fill_airport
      100.times{
        plane = double :plane
        airport.allow_landing(plane)
      }
    end

    it "can have capacity" do
      expect(airport.capacity).to eq(100)
    end

    it "can set capacity" do
      airport_two = Airport.new({:capacity => 50})
      expect(airport_two.capacity).to eq(50)
    end

    it "can allow landing of planes" do
      plane = double :plane
      airport.allow_landing(plane)
      expect(airport.planes).to eq([plane])
    end

    it "knows when it is full" do
      fill_airport
      expect(airport.full?).to be_true
    end

    it "knows when it is empty" do
      expect(airport.empty?).to be_true
    end
  end
end