class Route
  attr_reader :trains, :stations
  @stations = []

  def initialize(first_st, last_st)
    @stations = [first_st, last_st]
    @last_st = @stations.last

    puts "Создан маршрут #{first_st.station} - #{last_st.station}"
  end

  def add_st(station)
    last_st = @last_st
    @stations[@stations.count - 1] = station
    @stations << last_st
    puts "В маршрут добавлена станция #{station.station}"
  end

  def delete_st
    @stations.delete_at(@stations.count - 2) if @stations.count > 2
    puts "Из маршрута удалена станция #{@stations[stations.count - 2].station}"
  end

  def all_stations
    @stations
  end

  def stations(number)
    @stations[number]
  end

  def last_station
    @last_st
  end
end
