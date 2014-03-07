require_relative "../lib/plane"

describe Plane do
  let(:plane){Plane.new}

  context "state" do
    it "can be landed" do
      expect(plane.state).to eq("landed")
    end

    it "can be flying" do
      plane.take_off_in("sunny")
      expect(plane.state).to eq("flying")
    end


    it "a flying plane can land" do
      plane.take_off_in("sunny")
      plane.land_in("sunny")
      expect(plane.state).to eq("landed")
    end
  end

  context "weather" do
    it "can't fly if the weather is stormy" do
      airport = double :airport,{:weather => "stormy"}
      plane.take_off_in(airport.weather)
      expect(plane.state).to eq("landed")
    end

    it "can't land if the weather is stormy" do
      plane.take_off_in("sunny")
      plane.land_in("stormy")
      expect(plane.state).to eq("flying")
    end
  end
end