require_relative "../lib/plane"

describe Plane do
  context "state" do
    it "has a state" do
      plane = Plane.new
      expect(plane.state).to eq("Flying")
    end

    it "can be flying" do
      plane = Plane.new({:state => "Flying"})
      expect(plane.state).to eq("Flying")
    end


    it "can be landed" do
      plane = Plane.new({:state => "Landed"})
      expect(plane.state).to eq("Landed")
    end
  end

  context "Landing/Taking off" do
    it "when taking off it's state changes" do
      grounded_plane = Plane.new({:state => "Landed"})
      expect(grounded_plane.state).to eq("Landed")
      grounded_plane.taking_off
      expect(grounded_plane.state).to eq("Flying")
    end

    it "when landing it's state changes" do
      flying_plane = Plane.new({:state => "Flying"})
      expect(flying_plane.state).to eq("Flying")
      flying_plane.landing
      expect(flying_plane.state).to eq("Landed")
    end
  end
end