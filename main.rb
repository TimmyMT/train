require_relative './route.rb'
require_relative './station.rb'
require_relative './train.rb'
require_relative './carriage.rb'


user_stations = {}
user_trains = {}
user_routes = {}
user_carriages = []

# puts "Управление поездами"
# puts "Выберите действие:"
# puts "создать станцию, создать поезд, посмотреть список станций, посмотреть список поездов, выйти"
# puts "посмотреть список маршрутов, создать маршрут, назначить маршрут поезду, дополнить маршрут"
# puts "добавить вагон к поезду, отцепить вагон от поезда, отправить поезд, вернуть поезд на предидущую станцию"
# puts "посмотреть список поездов на станции"

puts "Run Trains!"
puts "Enter number action or 'exit'"
puts " "
puts "Stations actions:"
puts "1 # Create station, 3 # Show all stations, 13 # Show all train in station, 11 # Leave train from station"
puts " "
puts "Routes actions:"
puts "6 # Create route, 5 # Show all routes, 7 # Add station in route"
puts " "
puts "Trains actions:"
puts "2 # Create train, 4 # Show all trains, 8 # Shoose a route for train"
puts "9 # Add carriage to train, 10 # Delete carriage from train, 12 # Comeback train to previous station"
puts " "

action = gets.chomp

until action == 'exit' do
  case action
  when 1 # Create station
    puts "Enter the name Station"
    name = gets.chomp
    user_stations[name] = Station.new(name)

  # if action == 'создать станцию'
  #   puts "Введите название станции"
  #   name = gets.chomp
  #   user_stations[name] = Station.new(name)

  when 2 # Create train
    puts "Enther the type of train passenger/cargo"
    type_train = gets.chomp
    puts "Enter th name of train"
    name = gets.chomp
    user_trains[name] = PassengerTrain.new if type_train == 'passenger'
    user_trains[name] = CargoTrain.new if type_train == 'cargo'


  # elsif action == 'создать поезд'
  #   puts "Введите тип поезда пассажирский/грузовой"
  #   type_train = gets.chomp
  #
  #   if type_train == 'пассажирский'
  #     type_train = 1
  #   elsif type_train == 'грузовой'
  #     type_train = 0
  #   end
  #
  #   puts "Введите название поезда"
  #   name = gets.chomp
  #   if type_train == 1
  #     user_trains[name] = PassengerTrain.new
  #   elsif type_train == 0
  #     user_trains[name] = CargoTrain.new
  #   end

  when 3 # Show all stations
    user_stations.each {|key, value| puts "#{key} => #{value}" }

  # elsif action == 'посмотреть список станций'
  #   user_stations.each {|key, value| puts "#{key} => #{value}" }

  when 4 # Show all trains
    user_trains.each {|key, value| puts "#{key} => #{value}" }

  # elsif action == 'посмотреть список поездов'
  #   user_trains.each {|key, value| puts "#{key} => #{value}" }

  when 5 # Show all routes
    user_routes.each {|key, value| puts "#{key} => #{value}" }

  # elsif action == 'посмотреть список маршрутов'
  #   user_routes.each {|key, value| puts "#{key} => #{value}" }

  when 6 # Create route
    puts "Enter the name of route"
    name_route = gets.chomp
    puts "Enter the name of first station"
    name_station_first = gets.chomp
    puts "Enter the name of last station"
    name_station_last = gets.chomp
    user_routes[name_route] = Route.new(user_stations[name_station_first], user_stations[name_station_last])

  # elsif action == 'создать маршрут'
  #   puts "Введите название маршрута"
  #   name_route = gets.chomp
  #   puts "Ведите название начальной станции"
  #   name_station_first = gets.chomp
  #   puts "Ведите название конечной станции"
  #   name_station_last = gets.chomp
  #   user_routes[name_route] = Route.new(user_stations[name_station_first], user_stations[name_station_last])

  when 7 # Add station in route
    puts "Enter the name route for add station"
    name_route = gets.chomp
    puts "Enter the name station for add in route"
    name_station = gets.chomp
    user_routes[name_route].add_station(user_stations[name_station])

  # elsif action == 'дополнить маршрут'
  #   puts "Введите название маршрута который хотите дополнить"
  #   name_route = gets.chomp
  #   puts "Введите название станции которую хотите добавить к маршруту"
  #   name_station = gets.chomp
  #   route = user_routes[name_route]
  #   route.add_station(user_stations[name_station])

  when 8 # Shoose a route for train
    puts "Enter the name of train"
    name_train = gets.chomp
    puts "Enter the name route shoose for train"
    name_route = gets.chomp
    user_trains[name_train].route(user_routes[name_route])

  # elsif action == 'назначить маршрут поезду'
  #   puts "Введите название поезда который хотите отправить по маршруту"
  #   name_train = gets.chomp
  #   puts "Введите название маршрута"
  #   name_route = gets.chomp
  #   train = user_trains[name_train]
  #   train.route(user_routes[name_route])

  when 9 # Add carriage to train
    puts "Enter the name of train for add carriage"
    name_train = gets.chomp
    current_carriage = Carriage.new(train.type)
    user_trains[name_train].add_carriage(current_carriage)
    user_carriages << current_carriage

  # elsif action == 'добавить вагон к поезду'
  #   puts "Введите название поезда к которому хотите добавить вагон"
  #   name_train = gets.chomp
  #   train = user_trains[name_train]
  #   current_carriage = Carriage.new(train.type)
  #   train.add_carriage(current_carriage)
  #   user_carriages << current_carriage

  when 10 # Delete carriage from train
    puts "Enter the name train for delete carriage"
    name_train = gets.chomp
    user_trains[name_train].delete_carriage

  # elsif action == 'отцепить вагон от поезда'
  #   puts "Введите название поезда к которому хотите добавить вагон"
  #   name_train = gets.chomp
  #   train = user_trains[name_train]
  #   train.delete_carriage

  when 11 # Leave train from station
    puts "Enter the name station for leave train"
    name_station = gets.chomp

    if station.trains[0].current_station == station.trains[0].current_route.last_station
      puts "This is a last station"
    else
      user_stations[name_station].leave_train
    end

  # elsif action == 'отправить поезд'
  #   puts "Введите название станции которая должна отправить поезд"
  #   name_station = gets.chomp
  #   station = user_stations[name_station]
  #   if station.trains[0].current_station == station.trains[0].current_route.last_station
  #     puts "Это конечная станция"
  #   else
  #     station.leave_train
  #   end

  when 12 # Comeback train to previous station
    puts "Enter the name train for comeback"
    name_train = gets.chomp

    if train.current_station == train.current_route.stations(0)
      puts "This is a firs station"
    else
      user_trains[name_train].down_station
    end

  # elsif action == 'вернуть поезд на предидущую станцию'
  #   puts "Введите название поезда который нужно вернуть"
  #   name_train = gets.chomp
  #   train = user_trains[name_train]
  #   if train.current_station == train.current_route.stations(0)
  #     puts "Это начальная станция"
  #   else
  #     train.down_station
  #   end

  when 13 # Show all train in station
    puts "Enter the name station"
    name_station = gets.chomp
    user_stations[name_station].all_trains

  # elsif action == 'посмотреть список поездов на станции'
  #   puts "Введите название станции"
  #   name_station = gets.chomp
  #   station = user_stations[name_station]
  #   station.all_trains
  #
  # end

  puts " "
  puts "Stations actions:"
  puts "1 # Create station, 3 # Show all stations, 13 # Show all train in station, 11 # Leave train from station"
  puts " "
  puts "Routes actions:"
  puts "6 # Create route, 5 # Show all routes, 7 # Add station in route"
  puts " "
  puts "Trains actions:"
  puts "2 # Create train, 4 # Show all trains, 8 # Shoose a route for train"
  puts "9 # Add carriage to train, 10 # Delete carriage from train, 12 # Comeback train to previous station"
  puts " "

  action = gets.chomp

  end

end

exit
