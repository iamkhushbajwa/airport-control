class Plane
  attr_reader :state
  # def initialize(options={})
  #   @state = options[:state] || "Landed"
  # end

  def taking_off
    @state = "Flying"
  end

  def landing
    @state = "Landed"
  end
end