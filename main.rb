require_relative './route.rb'
require_relative './station.rb'
require_relative './train.rb'
require_relative './carriage.rb'


user_stations = {}
user_trains = {}
user_routes = {}
user_carriages = []

instructions = "Run Trains!\nEnter number action or 15 for exit\nStations actions:\n1 # Create station, 2 # Show all stations, 3 # Show all train in station, 4 # Leave train from station\nRoutes actions:\n5 # Create route, 6 # Show all routes, 7 # Add station in route\nTrains actions:\n8 # Create train, 9 # Show all trains, 10 # Shoose a route for train\n11 # Add carriage to train, 12 # Delete carriage from train, 13 # Comeback train to previous station\n"

print instructions
print 'Action: '
action = gets.chomp.to_i

until action == 15 do
  case action
  when 1
    puts "Enter the name Station"
    name = gets.chomp
    user_stations[name] = Station.new(name)

  when 2
    user_stations.each {|key, value| puts "#{key} => #{value}" }

  when 3
    puts "Enter the name station"
    name_station = gets.chomp
    user_stations[name_station].all_trains

  when 4
    puts "Enter the name station for leave train"
    name_station = gets.chomp
    if user_stations[name_station].trains[0].current_station == user_stations[name_station].trains[0].current_route.last_station
      puts "This is a last station"
    else
      user_stations[name_station].leave_train
    end

  when 5
    puts "Enter the name of route"
    name_route = gets.chomp
    puts "Enter the name of first station"
    name_station_first = gets.chomp
    puts "Enter the name of last station"
    name_station_last = gets.chomp
    user_routes[name_route] = Route.new(user_stations[name_station_first], user_stations[name_station_last])

  when 6
    user_routes.each {|key, value| puts "#{key} => #{value}" }

  when 7
    puts "Enter the name route for add station"
    name_route = gets.chomp
    puts "Enter the name station for add in route"
    name_station = gets.chomp
    user_routes[name_route].add_station(user_stations[name_station])

  when 8
    puts "Enther the type of train passenger/cargo"
    type_train = gets.chomp
    puts "Enter th name of train"
    name = gets.chomp
    user_trains[name] = PassengerTrain.new if type_train == 'passenger'
    user_trains[name] = CargoTrain.new if type_train == 'cargo'

  when 9
    user_trains.each {|key, value| puts "#{key} => #{value}" }

  when 10
    puts "Enter the name of train"
    name_train = gets.chomp
    puts "Enter the name route shoose for train"
    name_route = gets.chomp
    user_trains[name_train].route(user_routes[name_route])

  when 11
    puts "Enter the name of train for add carriage"
    name_train = gets.chomp
    current_carriage = Carriage.new(user_trains[name_train].type)
    user_trains[name_train].add_carriage(current_carriage)
    user_carriages << current_carriage

  when 12
    puts "Enter the name train for delete carriage"
    name_train = gets.chomp
    user_trains[name_train].delete_carriage

  when 13
    puts "Enter the name train for comeback"
    name_train = gets.chomp
    if user_trains[name_train].current_station == train.current_route.stations(0)
      puts "This is a firs station"
    else
      user_trains[name_train].down_station
    end

  when 14
    print instructions

  when 16

  end

  puts 'Show instructions 14'
  print 'Action: '
  action = gets.chomp.to_i

end

exit
