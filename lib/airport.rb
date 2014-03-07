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
    raise "Airport is under storm conditions, no landing is possible" if weather == "Stormy"
    raise "Airport is full" if full?
    planes << plane
  end

  def allow_take_off(plane)
    raise "Airport is under storm conditions, no take off is possible" if weather == "Stormy"
    raise "No planes at airport" if empty?
    planes.delete(plane)
  end

end