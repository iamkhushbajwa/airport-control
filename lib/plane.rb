class Plane
  attr_reader :state

  def taking_off
    @state = "Flying"
  end

  def landing
    @state = "Landed"
  end
end