require_relative "plane"

DEFAULT_CAPACITY = 100
class Airport
  attr_reader :capacity, :planes
  attr_accessor :weather
  def initialize(options={})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @planes = []
    @weather = "Sunny"
  end

  def full?
    planes.count == capacity
  end

  def empty?
    planes.count == 0
  end

  def allow_landing(plane)
    raise "You are already on the ground, you cannot land again" if plane.state == "Landed"
    raise "Airport is under storm conditions, no landing is possible" if weather == "Stormy"
    raise "Airport is full" if full?
    planes << plane
    # plane.state = "Landed"
  end

  def allow_take_off(plane)
    raise "You are already flying, you cannot take_off again" if plane.state == "Flying"
    raise "Airport is under storm conditions, no take off is possible" if weather == "Stormy"
    raise "No planes at airport" if empty?
    # plane.state = "Flying"
    planes.delete(plane)
  end

end