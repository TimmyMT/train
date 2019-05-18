class Route
  @@stations = []
  attr_reader :trains
  # attr_accessor :station

  def initialize(first_station, last_station)
    @@stations[0] = first_station
    @@stations[1] = last_station
    @inc = 1
    # @station = @@stations[0]
    @number = 0
  end

  def add_station(station)
    @@stations[@inc + 1] = @@stations[@inc]
    @@stations[@inc] = station
    @inc += 1
  end

  def delete_station
    @@stations.delete_at(1) if @@stations.count > 2
  end

  def all_stations
    @@stations
  end

  def stations(number)
    @@stations[number]
  end

  # def up_station
  #   @number += 1
  #   @station = @@stations[@number]
  # end
  #
  # def down_station
  #   @number -= 1
  #   @station = @@stations[@number]
  # end

  # def station
  #   @station
  # end

  # def previous_station
  #   puts "previous station #{@@stations[@number - 1]}"
  # end
  #
  # def next_station
  #   puts "next station #{@@stations[@number + 1]}"
  # end
end