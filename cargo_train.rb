require_relative './train.rb'
require_relative './cargo_carriage.rb'
# require_relative './block.rb'

class CargoTrain < Train
  # instance_counter

  attr_accessor :speed, :type, :carriages, :number, :carriages_block_arr

  def initialize(number)
    @number = number
    @carriages = []
    @carriages_block_arr = []
    @speed = 0
    @type = 0
    validate!
    puts "Train created #{@number}"
  end

end
