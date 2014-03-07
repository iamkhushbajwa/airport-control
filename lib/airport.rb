DEFAULT_CAPACITY = 100
class Airport
  attr_reader :capacity, :planes
  def initialize(options={})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @planes = []
  end

  def park(plane)
    planes << plane
  end

    def full?
    planes.count == capacity
  end

  def empty?
    planes.count == 0
  end

end