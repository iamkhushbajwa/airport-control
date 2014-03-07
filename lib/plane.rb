class Plane
  attr_reader :state
  def initialize(options={})
    @state = options[:state] || "Flying"
  end

  def taking_off
    @state = "Flying"
  end

  def landing
    @state = "Landed"
  end
end