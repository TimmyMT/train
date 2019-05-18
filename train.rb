class Train
  attr_reader :routes
  # attr_accessor :station

  def initialize(number, type, quantity_carriage)
    @number = number
    @type = type
    @quantity_carriage = quantity_carriage
    @speed = 0
    @route = 0
  end

  def speed_up
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def speed
    @speed
  end

  def quantity_carriage
    @quantity_carriage
  end

  def change_quantity_carriage(value)
    if value == '+' and @speed == 0
      @quantity_carriage += 1
    elsif value == '-' and @speed == 0
      @quantity_carriage -= 1
    else
      puts 'the train is yet stop'
    end
  end

  def route(name)
    @route = name
    @inc = 0
    @current_station = @route.stations(@inc)

  end

  def current_route
    @route
  end

  def current_station
    @current_station
  end

  def up_station
    @current_station = @route.stations(@inc + 1)
    @inc += 1
    puts @current_station
  end

  def next_station
    puts @route.stations(@inc + 1)
  end

  def down_station
    @current_station = @route.stations(@inc - 1)
    @inc -= 1
    puts @current_station
  end

  def previous_station
    puts @route.stations(@inc - 1)
  end
end