# frozen_string_literal: true

require_relative './train.rb'
require_relative './passenger_carriage.rb'
require_relative './validation.rb'

# child class of Train
class PassengerTrain < Train
  include Validation

  attr_accessor :speed, :type, :carriages, :number

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    @type = 1
    validate!
    # validate_presence(number)
    # validate_type(@type, 1)
    # validate_format(number, NUMBER_FORMAT)
    puts "Train created #{@number}"
  end
end
