# frozen_string_literal: true

require_relative './instance_counter.rb'
require_relative './valid.rb'

# user Stations
class Station
  include InstanceCounter
  include Valid

  attr_accessor :trains, :routes, :trains_block_arr

  NAME_FORMAT = /^[a-zA-Z]{7}[0-9]$/i.freeze
  @trains = []
  @@stations = []
  @trains_block_arr = []

  def self.stations
    @@stations
  end

  def initialize(name)
    @trains_block_arr = []
    @station = name
    validate!
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

  def all_trains
    @pas = @trains.count { |train| train.type == 1 }
    @carg = @trains.count { |train| train.type == 0 }
    puts "the station #{@station} now has #{@trains.count} trains: , Passenger: #{@pas}, Cargo: #{@carg}"
  end

  def leave_train
    @trains[0].up_station
    @trains.shift
    @trains_block_arr.shift unless @trains_block_arr.empty?
  end

  protected

  def validate!
    raise 'Wrong parameters for name of station (most be 7 symbols)' if @station !~ NAME_FORMAT

    true
  end
end
