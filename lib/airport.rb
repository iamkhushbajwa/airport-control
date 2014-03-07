DEFAULT_CAPACITY = 100
class Airport
  attr_reader :capacity, :planes
  attr_accessor :weather
  def initialize(options={})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @planes = []
    @weather =["Sunny", "Stormy", "Sunny", "Sunny", "Sunny", "Sunny"].sample
  end

  def full?
    planes.count == capacity
  end

  def empty?
    planes.count == 0
  end

  def check_for_landing_errors(plane)
    raise "You are already on the ground, you cannot land again" if plane.state == "Landed"
    raise "Airport is full" if full?
  end

  def check_for_take_off_errors(plane)
    raise "You are already flying, you cannot take off again" if plane.state == "Flying"
    raise "No planes at airport" if empty?
  end

  def check_errors_for(command, plane)
    raise "Airport is under storm conditions, no landing/take off is possible" if weather == "Stormy"
    command == "Landing" ? check_for_landing_errors(plane) : check_for_take_off_errors    
  end

  def allow_landing(plane)
    check_errors_for("Landing", plane)
    plane.landing
    planes << plane
  end

  def allow_take_off(plane)
    if planes.include?(plane)
      check_errors_for("Take Off", plane)
      plane.taking_off
      planes.delete(plane)
    else
      raise "You are are not currently at this airport"
    end
  end

end