class Station
  include ObQuan

  attr_reader :trains, :routes
  @trains = []
  @@stations = []

  def self.stations
    @@stations
  end

  def self.count
    @@stations.count
  end

  def initialize(name)
    @station = name
    @trains = []
    @@stations << self
    # inc_obj
    puts "Station created #{@station}"
  end

  def station
    @station
  end

  def add_train(name)
    @trains << name

    puts "a train #{name} arrived at the station #{@station}"
  end

  def all_trains
    @pas = @trains.count {|train| train.type == 1}
    @carg = @trains.count {|train| train.type == 0}

    puts "the station #{@station} now has #{@trains.count} trains: , Passenger: #{@pas}, Cargo: #{@carg}"
  end

  def leave_train
    @trains[0].up_station
    @trains.shift
    # if @trains[0].next_station != nil
  end

end
