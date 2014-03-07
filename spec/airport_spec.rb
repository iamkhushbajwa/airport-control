require_relative "../lib/airport"

describe Airport do
  let(:airport){Airport.new}
  let(:plane){double :plane}
  context "Standard Traffic control" do

    def fill_airport
      100.times{
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
      airport.allow_landing(plane)
      expect(airport.planes).to eq([plane])
    end

    it "when it is full it will not allow landing" do
      fill_airport
      expect(airport.full?).to be_true
      expect(lambda {airport.allow_landing(plane)}).to raise_error(RuntimeError)
    end

    it "when it is empty will not allow take-off" do
      expect(airport.empty?).to be_true
      expect(lambda {airport.allow_take_off(plane)}).to raise_error(RuntimeError)
    end
  end

  context "Extreme Weather Traffic Control" do
    it "won't allow take off if weather is stormy" do
      airport.allow_landing(plane)
      airport.weather = "Stormy"
      expect(lambda {airport.allow_take_off(plane)}).to raise_error(RuntimeError)
    end

    it "won't allow landing if weather is stormy" do
      airport.weather = "Stormy"
      expect(lambda {airport.allow_landing(plane)}).to raise_error(RuntimeError)
    end
  end
end