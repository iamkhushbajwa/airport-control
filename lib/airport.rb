DEFAULT_CAPACITY = 100
class Airport
  attr_reader :capacity
  def initialize(options={})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
  end

end