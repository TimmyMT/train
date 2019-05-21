class Carriage

  attr_reader :trains

  def initialize(type)
    if type == 1
      @type = 1
    elsif type == 0
      @type = 0
    end
    puts "Создан вагон типа: #{@type}"
  end

  def type
    @type
  end

end
