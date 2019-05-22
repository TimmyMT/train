class Carriage

  attr_reader :trains

  def initialize(type)
    @type = 1 if type == 1
    @type = 0 if type == 0
    puts "Carriage created of type: #{@type}"
  end

  def type
    @type
  end

end
