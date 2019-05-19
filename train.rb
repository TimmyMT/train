class Train
  attr_reader :routes, :stations

  def initialize(number, type, quantity_carriage)
    @number = number

    case type
    when 0
      @type = 'carg'
    when 1
      @type = 'pas'
    end

    # if type == 'pas'
    #   @type = 'pas'
    # elsif type == 'carg'
    #   @type = 'carg'
    # end

    @quantity_carriage = quantity_carriage
    @speed = 0
    @route = 0
    puts "Создан поезд №#{@number}, тип: #{@type}, количество вагонов: #{@quantity_carriage}"
  end

  def number
    @number
  end

  def type
    @type
  end

  def speed_up
    @speed += 5
    puts "Скорость поезда увеличилась = #{@speed} км/ч"
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
    # puts "Текущая станция #{@current_station.station}"
    @current_station
  end

  def up_station
    if @current_station == @route.last_station
      puts "Это конечная станция"
    else
      @inc += 1
      @current_station = @route.stations(@inc)
      @current_station.add_train(self)
      puts "Поезд прибыл на станцию: #{@current_station.station}"
    end

  end

  def next_station
    # puts "Следующая станция #{@route.stations(@inc + 1)}"
    @route.stations(@inc + 1)
  end

  def down_station
    @inc -= 1
    @current_station = @route.stations(@inc)
    @current_station.add_train(self)
    puts "Поезд вернулся на предидущую на станцию: #{@current_station.station}"
  end

  def previous_station
    @route.stations(@inc - 1)
    # puts "Предидущая станция #{@route.stations(@inc + 1)}"
  end
end
