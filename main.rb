require_relative './route.rb'
require_relative './station.rb'
require_relative './train.rb'
require_relative './carriage.rb'


user_stations = {}
user_trains = {}
user_routes = {}
user_carriages = []

puts "Управление поездами"
puts "Выберите действие:"
puts "создать станцию, создать поезд, посмотреть список станций, посмотреть список поездов, выйти"
puts "посмотреть список маршрутов, создать маршрут, назначить маршрут поезду, дополнить маршрут"
puts "добавить вагон к поезду, отцепить вагон от поезда, отправить поезд, вернуть поезд на предидущую станцию"
puts "посмотреть список поездов на станции"
action = gets.chomp

until action == 'выйти' do
  if action == 'создать станцию'
    puts "Введите название станции"
    name = gets.chomp
    user_stations[name] = Station.new(name)

  elsif action == 'создать поезд'
    puts "Введите тип поезда пассажирский/грузовой"
    type_train = gets.chomp

    if type_train == 'пассажирский'
      type_train = 1
    elsif type_train == 'грузовой'
      type_train = 0
    end

    puts "Введите название поезда"
    name = gets.chomp
    if type_train == 1
      user_trains[name] = PassengerTrain.new
    elsif type_train == 0
      user_trains[name] = CargoTrain.new
    end

  elsif action == 'посмотреть список станций'
    user_stations.each {|key, value| puts "#{key} => #{value}" }

  elsif action == 'посмотреть список поездов'
    user_trains.each {|key, value| puts "#{key} => #{value}" }

  elsif action == 'посмотреть список маршрутов'
    user_routes.each {|key, value| puts "#{key} => #{value}" }

  elsif action == 'создать маршрут'
    puts "Введите название маршрута"
    name_route = gets.chomp
    puts "Ведите название начальной станции"
    name_station_first = gets.chomp
    puts "Ведите название конечной станции"
    name_station_last = gets.chomp
    user_routes[name_route] = Route.new(user_stations[name_station_first], user_stations[name_station_last])

  elsif action == 'дополнить маршрут'
    puts "Введите название маршрута который хотите дополнить"
    name_route = gets.chomp
    puts "Введите название станции которую хотите добавить к маршруту"
    name_station = gets.chomp
    route = user_routes[name_route]
    route.add_station(user_stations[name_station])

  elsif action == 'назначить маршрут поезду'
    puts "Введите название поезда который хотите отправить по маршруту"
    name_train = gets.chomp
    puts "Введите название маршрута"
    name_route = gets.chomp
    train = user_trains[name_train]
    train.route(user_routes[name_route])

  elsif action == 'добавить вагон к поезду'
    puts "Введите название поезда к которому хотите добавить вагон"
    name_train = gets.chomp
    train = user_trains[name_train]
    current_carriage = Carriage.new(train.type)
    train.add_carriage(current_carriage)
    user_carriages << current_carriage

  elsif action == 'отцепить вагон от поезда'
    puts "Введите название поезда к которому хотите добавить вагон"
    name_train = gets.chomp
    train = user_trains[name_train]
    train.delete_carriage

  elsif action == 'отправить поезд'
    puts "Введите название станции которая должна отправить поезд"
    name_station = gets.chomp
    station = user_stations[name_station]
    if station.trains[0].current_station == station.trains[0].current_route.last_station
      puts "Это конечная станция"
    else
      station.leave_train
    end


  elsif action == 'вернуть поезд на предидущую станцию'
    puts "Введите название поезда который нужно вернуть"
    name_train = gets.chomp
    train = user_trains[name_train]
    if train.current_station == train.current_route.stations(0)
      puts "Это начальная станция"
    else
      train.down_station
    end

  elsif action == 'посмотреть список поездов на станции'
    puts "Введите название станции"
    name_station = gets.chomp
    station = user_stations[name_station]
    station.all_trains

  end

  puts "Выберите действие (создать станцию, создать поезд, посмотреть список станций, посмотреть список поездов, выйти)"
  puts "(посмотреть список маршрутов, дополнить маршрут)"
  action = gets.chomp
end

exit

 # Посмотреть список поездов на станции
