class Plane
  attr_reader :state
  def initialize
    @state = "landed"
  end

  def take_off_in(weather)
    @state = "flying" if weather == "sunny"
  end

  def land_in(weather)
    @state = "landed" if weather == "sunny"
  end
end