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
    @last_station = last_station
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
    @@stations[number]
  end

  def last_station
    @last_station
  end
end
