require_relative "../lib/plane"

describe Plane do
  context "state" do
    it "has a state" do
      plane = Plane.new
      expect(plane.state).to eq("Landed")
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
end