class PassengerTrain < Train

  attr_accessor :speed, :type, :carriages

  def initialize
    @carriages = []
    @speed = 0
    @type = 1
    puts "Train created of type passenger: #{self}"
  end

end
