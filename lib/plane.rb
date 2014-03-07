class Plane
  attr_accessor :state
  def initialize(options={})
    @state = options[:state] || "Landed"
  end
end