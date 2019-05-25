require_relative './instance_counter.rb'

class Route
  include InstanceCounter

  attr_reader :trains, :stations

  # NUMBER_FORMAT = /^[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}$/i
  @stations = []
  @@routes = []

  def self.routes
    @@routes
  end

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    # validate!
    @@routes << self
    puts "Route created #{first_station.station} - #{last_station.station}"
    register_instance
  end

  def add_station(station)
    # some_array.insert(index, value) - добавить элемент в массив
    @stations.insert(1, station)
    validate!
    puts "In route added station #{station.station}"
  end

  def delete_station
    @stations.delete_at(1) if @stations.count > 2

    puts "Station deleted from route #{@stations[stations.count - 2].station}"
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

  # protected

  # def validate!
  #   @stations.each do |station|
  #     raise "Wrong parameters for name of station" if station !~ NUMBER_FORMAT
  #   end
  #
  #   true
  # end

end
