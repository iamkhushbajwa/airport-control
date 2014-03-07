DEFAULT_CAPACITY = 100
class Airport
  attr_reader :capacity, :planes
  def initialize(options={})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @planes = []
  end

  def full?
    planes.count == capacity
  end

  def empty?
    planes.count == 0
  end

  def allow_landing(plane)
    raise "Aiport is full/No plane as argument" if full? #|| !plane.instance_of?(Plane)
    planes << plane
  end

  def allow_take_off(plane)
    raise "No planes at airport/No plane as argument" if empty? #|| !plane.instance_of?(Plane)
    planes.delete(plane)
  end

end