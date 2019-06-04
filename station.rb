require_relative './instance_counter.rb'
# require_relative './valid.rb'
require_relative './accessors.rb'
require_relative './validation.rb'

# user Stations
class Station
  include InstanceCounter
  # include Valid
  extend Accessors
  include Validation

  NAME_FORMAT = /^[a-zA-Z]{7}[0-9]$/i.freeze

  attr_accessor :trains, :routes
  attr_reader :station
  my_accessor :trains
  strong_accessor :trains, String

  @trains = []
  # rubocop:disable all
  @@stations = []
  # rubocop:enable all

  def self.stations
    @@stations
  end

  def initialize(name)
    validate_presence(name)
    @station = name
    validate_format(name, NAME_FORMAT)
    @trains = []
    @@stations << self
    register_instance
  end

  def each_train
    @trains.each { |train| yield train }
  end

  attr_reader :station

  def add_train(name)
    @trains << name
    puts "a train #{name} arrived at the station #{@station}"
  end

  # rubocop:disable all
  def all_trains
    @pas = @trains.count { |train| train.type == 1 }
    @carg = @trains.count { |train| train.type == 0 }
    puts "the station #{@station} now has #{@trains.count} trains: , Passenger: #{@pas}, Cargo: #{@carg}"
  end
  # rubocop:enable all

  def leave_train
    @trains[0].up_station
    @trains.shift
  end

  # rubocop:disable all
  protected


  def validate!
    raise 'Wrong parameters for name of station (most be 7 symbols)' if @station !~ NAME_FORMAT

    true
  end
  # rubocop:enable all
end
