class CargoTrain < Train

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
