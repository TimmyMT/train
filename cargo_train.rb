require_relative './train.rb'
require_relative './cargo_carriage.rb'
require_relative './block.rb'

class CargoTrain < Train
  include Block

  attr_accessor :speed, :type, :carriages, :number

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    @type = 0
    validate!
    puts "Train created #{@number}"
  end

end
