class Train
  attr_reader :routes, :stations, :carriages
  attr_reader :type, :speed
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
        puts "Вагон пристыкован"
      else
        puts "Вагон не подходит"
      end
    else
      puts "Остановите поезд чтобы пристыковать вагон"
    end
  end

  def delete_carriage
    if @speed == 0
      @carriages.pop
      puts "Вагон отстыкован"
    else
      puts "Остановите поезд чтобы отстыковать вагон"
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

    puts "Поезд #{@number} готовится к отправке из станции #{@current_station.station} по маршруту #{@route}"
  end

  def current_route
    @route
  end

  def current_station
    @current_station
  end

  def up_station
    if @current_station == @route.last_station
      puts "Конечная станция"
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
      puts "Отправная станция"
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

########################################################################################################################

class PassengerTrain < Train

  attr_accessor :speed, :type, :carriages

  def initialize
    @carriages = []
    @speed = 0
    @type = 1
    puts "Из ангара выкатили пассажирский поезд #{self}"
  end

  def type
    @type
  end

end

########################################################################################################################

class CargoTrain < Train

  attr_accessor :speed, :type, :carriages

  def initialize
    @carriages = []
    @speed = 0
    @type = 0
    puts "Из ангара выкатили грузовой поезд #{self}"
  end

  def type
    @type
  end

end
