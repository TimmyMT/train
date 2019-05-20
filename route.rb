class Route
  attr_reader :trains, :stations
  @stations = []

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    # @last_st = @stations.last

    puts "Создан маршрут #{first_station.station} - #{last_station.station}"
  end

  def add_station(station)
    # last_station = @stations.last
    # @stations[@stations.count - 1] = station
    # @stations << last_station
    # сортировка
    @stations.insert(1, station)

    puts "В маршрут добавлена станция #{station.station}"
  end

  def delete_station
    @stations.delete_at(1) if @stations.count > 2

    puts "Из маршрута удалена станция #{@stations[stations.count - 2].station}"
  end

  def all_stations
    @stations
  end

  def stations(number)
    @stations[number]
  end

  def last_station
    @stations.last
  end
end
