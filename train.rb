class Train
  attr_reader :routes, :stations, :carriages
  attr_accessor :type, :speed
  @carriages = []

  def initialize
    @speed = 0
    @carriages = []
  end

  def speed_up
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    if @speed == 0
      if @type == carriage.type
        @carriages << carriage
        puts "carriage docked"
      else
        puts "carriage does not fit"
      end
    else
      puts "stop the train to dock the carriage"
    end
  end

  def delete_carriage
    if @speed == 0
      @carriages.pop
      puts "carriage undocked"
    else
      puts "stop the train to undock the carriage"
    end
  end

  def all_carriages
    @carriages
  end

  def route(name)
    @current_number = 0
    @route = name
    @current_station = @route.stations(@current_number)
    @current_station.add_train(self)

    puts "the train #{self} is ready to be shipped from the station #{@current_station.station} on route #{@route}"
  end

  def current_route
    @route
  end

  def current_station
    @current_station
  end

  def up_station
    if @current_station == @route.last_station
      puts "Last station"
    else
      @current_number += 1
      @current_station = @route.stations(@current_number)
      @current_station.add_train(self)
    end
  end

  def next_station
    @route.stations(@current_number + 1)
  end

  def down_station
    if @current_station == @route.last_station
      puts "First station"
    else
      @current_number -= 1
      @current_station = @route.stations(@current_number)
      @current_station.add_train(self)
    end
  end

  def prev_station
    @route.stations(@current_number - 1)
  end
end
