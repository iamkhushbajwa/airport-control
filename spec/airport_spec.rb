require_relative "../lib/airport"

describe Airport do
  let(:airport){Airport.new}
  let(:flying_plane){double :flying_plane,{:state => "Flying"}}
  let(:grounded_plane){double :grounded_plane,{:state => "Landed"}}
  context "Standard Traffic control" do

    def fill_airport
      100.times{
        expect(flying_plane).to receive(:landing)
        airport.allow_landing(flying_plane)
      }
    end

    def set_sunny_weather
      allow(airport).to receive(:weather) {"Sunny"}
    end

    it "can have capacity" do
      set_sunny_weather
      expect(airport.capacity).to eq(100)
    end

    it "can set capacity" do
      set_sunny_weather
      airport_two = Airport.new({:capacity => 50})
      expect(airport_two.capacity).to eq(50)
    end

    it "can allow landing of planes" do
      set_sunny_weather
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      expect(airport.planes).to eq([flying_plane])
    end

    it "when it is full it will not allow landing" do
      set_sunny_weather
      fill_airport
      expect(airport.full?).to be_true
      expect(lambda {airport.allow_landing(flying_plane)}).to raise_error(RuntimeError)
    end

    it "when it is empty will not allow take-off" do
      set_sunny_weather
      expect(airport.empty?).to be_true
      expect(lambda {airport.allow_take_off(grounded_plane)}).to raise_error(RuntimeError)
    end

    it "ensure that only flying planes can be landed" do
      set_sunny_weather
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      expect(airport.planes).to eq([flying_plane])
      expect(lambda {airport.allow_landing(grounded_plane)}).to raise_error(RuntimeError)
    end
  end

  context "Extreme Weather Traffic Control" do
    def set_stormy_weather
      allow(airport).to receive(:weather) {"Stormy"}
    end

    it "won't allow take off if weather is stormy" do
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      set_stormy_weather
      expect(lambda {airport.allow_take_off(grounded_plane)}).to raise_error(RuntimeError)
    end

    it "won't allow landing if weather is stormy" do
      set_stormy_weather
      expect(lambda {airport.allow_landing(flying_plane)}).to raise_error(RuntimeError)
    end
  end
end