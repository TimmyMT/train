# frozen_string_literal: true

require_relative './train.rb'
require_relative './passenger_carriage.rb'

# child class of Train
class PassengerTrain < Train
  attr_accessor :speed, :type, :carriages, :number, :carriages_block_arr

  def initialize(number)
    @number = number
    @carriages = []
    @carriages_block_arr = []
    @speed = 0
    @type = 1
    validate!
    puts "Train created #{@number}"
  end
end
