class Plane
  def initialize
    @state = "landed"
  end

  def take_off
    @state = "flying"
  end

  def land
    @state = "landed"
  end

  def state
    @state
  end
end