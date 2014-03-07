class Plane
  def initialize
    @state = "landed"
  end

  def take_off
    @state = "flying"
  end

  def state
    @state
  end
end