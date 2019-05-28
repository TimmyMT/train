require_relative './train.rb'
require_relative './passenger_carriage.rb'
require_relative './block.rb'

class PassengerTrain < Train
  include Block

  attr_accessor :speed, :type, :carriages, :number, :seats
  @seats = []

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    @type = 1
    validate!
    puts "Train created #{@number}"
  end

end
