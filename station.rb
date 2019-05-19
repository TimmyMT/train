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
  end

  def all_trains
    
    if @trains.count
      @pas = @trains.count {|train| train.type == 'pas'}
      @carg = @trains.count {|train| train.type == 'carg'}
      puts "На станции #{@station} сейчас находится поездов: #{@trains.count}, Пассажирских: #{@pas}, Грузовых: #{@carg}"
    else
      puts "На станции #{@station} нет поездов"
    end
  end

  def leave_train
    @trains[0].up_station
    @trains.shift if @trains[0].next_station != nil
  end
end
