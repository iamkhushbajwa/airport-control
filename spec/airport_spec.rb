require_relative "../lib/airport"

describe Airport do
  let(:airport){Airport.new}
  let(:flying_plane){double :flying_plane,{:state => "Flying"}}
  let(:grounded_plane){double :grounded_plane,{:state => "Landed"}}

  def fill_airport
    100.times{
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
    }
  end

  def set_weather_to(weather)
    allow(airport).to receive(:weather) {weather}
  end

  context "Standard Traffic control" do
    it "can have capacity" do
      set_weather_to("Sunny")
      expect(airport.capacity).to eq(100)
    end

    it "can set capacity" do
      set_weather_to("Sunny")
      airport_two = Airport.new({:capacity => 50})
      expect(airport_two.capacity).to eq(50)
    end

    it "can allow landing of planes" do
      set_weather_to("Sunny")
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      expect(airport.planes).to eq([flying_plane])
    end

    it "when it is full it will not allow landing" do
      set_weather_to("Sunny")
      fill_airport
      expect(airport.full?).to be_true
      expect(lambda {airport.allow_landing(flying_plane)}).to raise_error(RuntimeError)
    end

    it "when it is empty will not allow take-off" do
      set_weather_to("Sunny")
      expect(airport.empty?).to be_true
      expect(lambda {airport.allow_take_off(grounded_plane)}).to raise_error(RuntimeError)
    end

    it "ensure that only flying planes can be landed" do
      set_weather_to("Sunny")
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      expect(airport.planes).to eq([flying_plane])
      expect(lambda {airport.allow_landing(grounded_plane)}).to raise_error(RuntimeError)
    end

    it "ensures only planes based there can take" do
      airport_one = Airport.new
      airport_two = Airport.new
      expect(flying_plane).to receive(:landing)
      allow(airport_one).to receive(:weather) {"Sunny"}
      allow(airport_two).to receive(:weather) {"Sunny"}
      airport_one.allow_landing(flying_plane)
      expect(lambda {airport_two.allow_take_off(flying_plane)}).to raise_error(RuntimeError)
    end
  end

  context "Extreme Weather Traffic Control" do


    it "won't allow take off if weather is stormy" do
      set_weather_to("Sunny")
      expect(flying_plane).to receive(:landing)
      airport.allow_landing(flying_plane)
      set_weather_to("Stormy")
      expect(lambda {airport.allow_take_off(grounded_plane)}).to raise_error(RuntimeError)
    end

    it "won't allow landing if weather is stormy" do
      set_weather_to("Stormy")
      expect(lambda {airport.allow_landing(flying_plane)}).to raise_error(RuntimeError)
    end
  end
end