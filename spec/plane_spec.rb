require_relative "../lib/plane"

describe Plane do
  context "state" do
    let(:plane){Plane.new}

    it "can be landed" do
      expect(plane.state).to eq("landed")
    end

    it "can be flying" do
      plane.take_off
      expect(plane.state).to eq("flying")
    end

    it "a flying plane can land" do
      plane.take_off
      plane.land
      expect(plane.state).to eq("landed")
    end

  end
end