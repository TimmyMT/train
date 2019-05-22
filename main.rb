require_relative './route.rb'
require_relative './station.rb'
require_relative './train.rb'
require_relative './carriage.rb'


user_stations = {}
user_trains = {}
user_routes = {}

puts "Управление поездами"
puts "Выберите действие (создать станцию, создать поезд, посмотреть список станций, посмотреть список поездов, выйти)"
puts "(посмотреть список маршрутов, дополнить маршрут)"
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

  end

  puts "Выберите действие (создать станцию, создать поезд, посмотреть список станций, посмотреть список поездов, выйти)"
  puts "(посмотреть список маршрутов, дополнить маршрут)"
  action = gets.chomp
end

exit

# Назначить маршрут поезду
# Добавить вагон к поезду
# Отцепить вагон от поезда
# Отправить поезд
 # Вернуть поезд на предыдущую станцию
# Посмотреть список станций
 # Посмотреть список поездов на станции
