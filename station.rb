require_relative './instance_counter.rb'
require_relative './valid.rb'
# require_relative './block.rb'

class Station
  include InstanceCounter
  include Valid
  # instance_counter

  attr_accessor :trains, :routes, :trains_block_arr

  NAME_FORMAT = /^[a-zA-Z]{7}[0-9]$/i
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


  ######################################################################################################################
  def puts_block
    yield
  end

  def create_trains_list
    until @trains_block_arr == []
      @trains_block_arr.pop
    end
    @trains.each do |train|
      @trains_block_arr << "Train number: #{train.number}, type: #{train.type}, carriages: #{train.carriages}"
    end
  end
  # А где он проходит по всем поездам на станции, передавая каждый поезд в блок? Тут create_trains_list
  ######################################################################################################################

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
    unless @trains_block_arr.empty?
      @trains_block_arr.shift
    end
  end

  protected

  def validate!
    raise "Wrong parameters for name of station (most be 7 symbols)" if @station !~ NAME_FORMAT
    true
  end

end
