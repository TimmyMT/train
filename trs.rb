# Маршруты
class Route
  @@stations = []
  attr_reader :trains, :stations

  def initialize(first_station, last_station)
    @@stations[0] = first_station
    @@stations[1] = last_station
    puts "Создан маршрут: #{first_station.station} - Пункт отправления"
    puts "#{last_station.station} - Конечная остановка"
    @inc = 1
    @number = 0
  end

  def add_station(station)
    @@stations[@inc + 1] = @@stations[@inc]
    @@stations[@inc] = station
    puts "В маршрут добавлена станция #{station.station}"
    @inc += 1
  end

  def delete_station
    if @@stations.count > 2
      @@stations.delete_at(1)
      puts "Станция #{@@stations[1].station} удалена из маршрута"
    end
  end

  def all_stations
    puts "Список всех станций маршрута: "
    @@stations.each do |s|
      puts "#{s.station}"
    end
  end

  def stations(number)
    # puts "Станция под номером #{number}"
    @@stations[number]
  end
end

########################################################################################################################
########################################################################################################################

# Поезда
class Train
  attr_reader :routes, :stations

  def initialize(number, type, quantity_carriage)
    @number = number

    if type == true
      @type = "Пассажирский"
    else
      @type = "Грузовой"
    end

    @quantity_carriage = quantity_carriage
    @speed = 0
    @route = 0
    puts "Создан поезд №#{@number}, тип: #{@type}, количество вагонов: #{@quantity_carriage}"
  end

  def number_train
    @number
  end

  def type_train
    @type
  end

  def speed_up
    @speed += 5
    puts "Скорость поезда увеличилась на 5 км/ч = #{@speed} км/ч"
  end

  def stop
    @speed = 0
    puts "Остановка"
  end

  def speed
    @speed
    puts "Текущая скорость поезда #{@speed} км/ч"
  end

  def quantity_carriage
    @quantity_carriage
    # puts "Количество вагонов: #{@quantity_carriage}"
  end

  def change_quantity_carriage(value)
    if value == '+' and @speed == 0
      @quantity_carriage += 1
      puts "Вагон пристыкован"
    elsif value == '-' and @speed == 0
      @quantity_carriage -= 1
      puts "Вагон отстыкован"
    else
      puts 'Поезд всё ещё движется, чтобы прицепить/отцепить вагон потребуется полная остановка'
    end
  end

  def route(name)
    @route = name
    @inc = 0
    @current_station = @route.stations(@inc)
    @current_station.add_train(self)
    puts "Для поезда №#{@number} установлен маршрут, поезд прибыл на станцию отправления #{@current_station.station}"
  end

  def current_route
    @route
    puts "Текущий маршрут поезда #{@route}"
  end

  def current_station
    @current_station
    puts "Текущая станция #{@current_station.station}"
  end

  def up_station
    @current_station = @route.stations(@inc + 1)
    @inc += 1
    @current_station.add_train(self)
    puts "Поезд прибыл на станцию: #{@current_station.station}"
  end

  def next_station
    # puts @route.stations(@inc + 1)
    puts "Следующая станция #{@route.stations(@inc + 1)}"
  end

  def down_station
    @current_station = @route.stations(@inc - 1)
    @inc -= 1
    @current_station.add_train(self)
    puts "Поезд вернулся на предидущую на станцию: #{@current_station.station}"
  end

  def previous_station
    # puts @route.stations(@inc - 1)
    puts "Предидущая станция #{@route.stations(@inc + 1)}"
  end
end


########################################################################################################################
########################################################################################################################

# Станции
class Station
  attr_reader :trains, :routes

  def initialize(name)
    @station = name
    @trains = []
    puts "Создана станция #{@station}"
  end

  def station
    @station
  end

  def add_train(name)
    @trains << name
    # puts "На станцию #{@station} прибыл поезд №#{name.number_train}"
  end

  def all_trains
    if @trains.count != nil
      puts "На станции #{@station} сейчас находится поездов: #{@trains.count}"
    else
      puts "На станции нет поездов"
    end
  end

  def leave_train
    puts "#{@trains[0].type_train} поезд №#{@trains[0].number_train} отправился на следующую станцию"
    @trains[0].up_station
    @trains.shift
  end
end