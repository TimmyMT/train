require_relative './instance_counter.rb'

class Station
  include InstanceCounter

  attr_reader :trains, :routes

  NUMBER_FORMAT = /^[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}$/i
  @trains = []
  @@stations = []

  def self.stations
    @@stations
  end

  def initialize(name)
    @station = name
    validate!
    @trains = []
    @@stations << self
    puts "Station created #{@station}"
    register_instance
  end

  def valid?
    validate!
  rescue
    false
  end

  def station
    @station
  end

  def add_train(name)
    @trains << name

    puts "a train #{name} arrived at the station #{@station}"
  end

  def all_trains
    @pas = @trains.count {|train| train.type == 1}
    @carg = @trains.count {|train| train.type == 0}

    puts "the station #{@station} now has #{@trains.count} trains: , Passenger: #{@pas}, Cargo: #{@carg}"
  end

  def leave_train
    @trains[0].up_station
    @trains.shift
  end

  protected

  def validate!
    raise "Wrong parameters for name of station" if @station !~ NUMBER_FORMAT
    true
  end

end
