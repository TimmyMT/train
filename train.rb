class Train
  attr_reader :routes, :stations
  attr_reader :number, :type, :quantity_carriage, :speed

  def initialize(number, type, quantity_carriage)
    @number = number

    case type
    when 0
      @type = 'carg'
    when 1
      @type = 'pas'
    end

    @quantity_carriage = quantity_carriage
    @speed = 0

    puts "Из ангара выкатили #{@type} поезд под номером #{@number} количество вагонов #{@quantity_carriage}"
  end

  # def number
  #   @number
  # end
  #
  # def type
  #   @type
  # end
  #
  # def quantity_carriage
  #   @quantity_carriage
  # end
  #
  # def speed
  #   @speed
  # end

  def speed_up
    @speed += 5
  end

  def stop
    @speed = 0
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
