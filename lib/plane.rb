class Plane
  attr_reader :state
  def initialize
    @state = "landed"
  end

  def take_off
    @state = "flying"
  end

  def land
    @state = "landed"
  end
end