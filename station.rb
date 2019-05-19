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
    @pas = 0
    @carg = 0
    # @trains.count {|train| train.type == 'pas'; @pas += 1}
    # @trains.count {|train| train.type == 'carg'; @carg += 1}
    if @trains.count != nil
      @trains.each do |train|
        if train.type == 'pas'
          @pas += 1
        elsif train.type == 'carg'
          @carg += 1
        end
      end
      puts "На станции #{@station} сейчас находится поездов: #{@trains.count}, Пассажирских: #{@pas}, Грузовых #{@carg}"
    else
      puts "На станции нет поездов"
    end
  end

  def leave_train
    # puts "#{@trains[0].type_train} поезд №#{@trains[0].number_train} отправился на следующую станцию"
    @trains[0].up_station
    @trains.shift if @trains[0].next_station != nil
  end
end
