require_relative "../lib/plane"

describe Plane do
  context "state" do
    let(:plane){Plane.new}

    it "can be flying" do
      expect(plane).to be_flying
    end

    it "can be landed" do
      expect(plane). to be_landed
    end
  end
end