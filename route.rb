require_relative './instance_counter.rb'

class Route
  include InstanceCounter

  attr_reader :trains, :stations

  @stations = []
  @@routes = []

  def self.routes
    @@routes
  end

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @@routes << self
    register_instance
  end

  def add_station(station)
    # some_array.insert(index, value) - добавить элемент в массив
    @stations.insert(1, station)
  end

  def delete_station
    @stations.delete_at(1) if @stations.count > 2
    # puts "Station deleted from route #{@stations[stations.count - 2].station}"
  end

  def all_stations
    @stations
  end

  def stations(number)
    @stations[number]
  end

  def last_station
    @stations.last
  end

end
