require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :storage, :weather

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @storage = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Storm's a-brewing - Better divert course!" if weather.stormy?
    fail "No room at the Inn - Try another airport!" if full?
    plane.status = "Grounded"
    puts "#{plane} has now landed."
    storage << plane
  end

  def takeoff(plane)
    fail "Storm's a-brewing - Better hold tight!" if weather.stormy?
    fail "No planes available" if empty?
    plane.status = "Airborne"
    puts "#{plane} has now taken off"
    storage.delete(plane)
  end

  private

  def full?
    storage.length >= capacity
  end

  def empty?
    storage.empty?
  end
end
