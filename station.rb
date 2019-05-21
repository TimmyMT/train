class Station
  attr_reader :trains, :routes
  @trains = []

  def initialize(name)
    @station = name
    @trains = []

    puts "Построена станция #{@station}"
  end

  def station
    @station
  end

  def add_train(name)
    @trains << name

    puts "На станцию #{@station} прибыл поезд #{name}"
  end

  def all_trains
    @pas = @trains.count {|train| train.type == 1}
    @carg = @trains.count {|train| train.type == 0}

    puts "На станции #{@station} сейчас находится поездов: #{@trains.count}, Пассажирских: #{@pas}, Грузовых: #{@carg}"
  end

  def leave_train
    @trains[0].up_station
    @trains.shift
    # if @trains[0].next_station != nil
  end

  def trains
    @trains
  end
end
