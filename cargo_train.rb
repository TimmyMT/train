class CargoTrain < Train

  attr_accessor :speed, :type, :carriages

  def initialize
    @carriages = []
    @speed = 0
    @type = 0
    puts "Train created of type cargo: #{self}"
  end

  def type
    @type
  end

end
