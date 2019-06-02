# frozen_string_literal: true

require_relative './instance_counter.rb'
require_relative './valid.rb'
require_relative './company.rb'

# my Train class
class Train
  include Company
  include InstanceCounter
  include Valid

  attr_reader :routes, :stations, :carriages
  attr_accessor :type, :speed, :number, :trains, :carriages_block_arr

  NUMBER_FORMAT = /^[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}-*[a-zA-Z0-9]{1}$/i.freeze
  @carriages = []
  # rubocop:disable all
  @@trains = {}
  # rubocop:enable all
  @number = 0
  @carriages_block_arr = []

  def self.trains
    @@trains
  end

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @speed = 0
    @carriages = []
    @carriages_block_arr = []
    @number = number
    validate!
    @@trains[number] = self
    register_instance
  end

  def each_carriage
    @carriages.each { |carriage| yield carriage }
  end

  def speed_up
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @type == carriage.type && @speed.zero?
  end

  def delete_carriage
    @carriages.pop if @speed.zero?
    @carriages_block_arr.pop unless @carriages_block_arr.empty?
  end

  def all_carriages
    @carriages
  end

  def route(name)
    @current_number = 0
    @route = name
    @current_station = @route.stations(@current_number)
    @current_station.add_train(self)
  end

  def current_route
    @route
  end

  attr_reader :current_station

  def up_station
    if @current_station == @route.last_station
      puts 'Last station'
    else
      @current_number += 1
      @current_station = @route.stations(@current_number)
      @current_station.add_train(self)
    end
  end

  def next_station
    @route.stations(@current_number + 1)
  end

  def down_station
    if @current_station == @route.last_station
      puts 'First station'
    else
      @current_number -= 1
      @current_station = @route.stations(@current_number)
      @current_station.add_train(self)
    end
  end

  def prev_station
    @route.stations(@current_number - 1)
  end

  protected

  def validate!
    raise 'Wrong parameters for number of train' if @number !~ NUMBER_FORMAT

    true
  end
end
