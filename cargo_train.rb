# frozen_string_literal: true

require_relative './train.rb'
require_relative './cargo_carriage.rb'

# This is a class Train for my stations.
class CargoTrain < Train
  attr_accessor :speed, :type, :carriages, :number

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    @type = 0
    validate_presence(number)
    validate_type(@type, 0)
    validate_format(number, NUMBER_FORMAT)
    puts "Train created #{@number}"
  end
end
