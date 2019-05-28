require_relative './route.rb'
require_relative './station.rb'
require_relative './train.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'
require_relative './cargo_train.rb'

user_stations = {}
user_trains = {}
user_routes = {}
user_carriages = {}

instructions = "Run Trains!\nEnter number action or 15 for exit\nStations actions:\n1 # Create station, 2 # Show all stations, 3 # Show all train in station, 4 # Leave train from station\nRoutes actions:\n5 # Create route, 6 # Show all routes, 7 # Add station in route\nTrains actions:\n8 # Create train, 9 # Show all trains, 10 # Shoose a route for train\n11 # Add carriage to train, 12 # Delete carriage from train, 13 # Comeback train to previous station\n"

print instructions
print 'Action: '
action = gets.chomp.to_i

def puts_block
  yield
end

until action == 15 do
  case action
  # Station actions
  when 1
    puts "Enter the number Station"
    number = gets.chomp
    puts "Enter the name Station (7 symbols)"
    begin
      name = gets.chomp
      user_stations[number] = Station.new(name)
      puts "Station created #{name}"
    rescue => e
      puts "Error: #{e.message}, please try again"
      retry
    end

  when 2
    user_stations.each {|key, value| puts "#{key} => #{value}" }

  when 3
    puts "Enter the name station"
    name_station = gets.chomp
    user_stations[name_station].all_trains

  when 4
    puts "Enter the name station for leave train"
    name_station = gets.chomp
    if user_stations.key?(name_station)
      if user_stations[name_station].trains[0].current_station == user_stations[name_station].trains[0].current_route.last_station
        puts "This is a last station"
      else
        user_stations[name_station].leave_train
      end
    else
      puts "Something wrong"
    end

  # Route actions
  when 5
    puts "Enter the name of route"
    name_route = gets.chomp
    puts "Enter the number of first station"
    number_station_first = gets.chomp
    puts "Enter the number of last station"
    number_station_last = gets.chomp
    if user_stations.key?(number_station_first) and user_stations.key?(number_station_last)
      user_routes[name_route] = Route.new(user_stations[number_station_first], user_stations[number_station_last])
      puts "Route created #{user_stations[number_station_first]} - #{user_stations[number_station_last]}"
    else
      puts "Something wrong"
    end

  when 6
    user_routes.each {|key, value| puts "#{key} => #{value}" }

  when 7
    puts "Enter the name route for add station"
    name_route = gets.chomp
    puts "Enter the number station for add in route"
    number_station = gets.chomp
    if user_routes.key?(name_route) and user_stations.key?(number_station)
      user_routes[name_route].add_station(user_stations[number_station])
      puts "In route added station #{number_station}"
    else
      puts "Something wrong"
    end

  # Train actions
  when 8
    puts "Enther the type of train passenger/cargo"
    type_train = gets.chomp
    puts "Enter the name of train"
    name = gets.chomp
    puts "Enter the 3 symbols for number of train"
    begin
      number = gets.chomp
      user_trains[name] = PassengerTrain.new(number) if type_train == 'passenger'
      user_trains[name] = CargoTrain.new(number) if type_train == 'cargo'
    rescue => e
      puts "Error: #{e.message}, please try again"
      retry
    end

  when 9
    user_trains.each {|key, value| puts "#{key} => #{value}" }

  when 10
    puts "Enter the name of train"
    name_train = gets.chomp
    puts "Enter the name route shoose for train"
    name_route = gets.chomp
    if user_trains.key?(name_train) and user_routes.key?(name_route)
      user_trains[name_train].route(user_routes[name_route])
      puts "the train #{user_trains[name_train]} is ready to be shipped from the station #{user_trains[name_train].current_station.station} on route #{user_routes[name_route]}"
    else
      puts "Something wrong"
    end

  when 11
    puts "Enter the name of train for add carriage"
    name_train = gets.chomp
    puts "Enter the name carriage"
    name_carriage = gets.chomp
    if user_trains.key?(name_train)
      if user_trains[name_train].type == 1
        puts "How many seats?"
        seats = gets.chomp.to_i
        user_carriages[name_carriage] = PassengerCarriage.new(seats)
        puts "Created seats: #{seats}"
      elsif user_trains[name_train].type == 0
        puts "How many volume?"
        volume = gets.chomp.to_i
        user_carriages[name_carriage] = CargoCarriage.new(volume)
        puts "Created volume: #{volume}"
      end
      user_trains[name_train].add_carriage(user_carriages[name_carriage])
    end

  when 12
    puts "Enter the name train for delete carriage"
    name_train = gets.chomp
    if user_trains.key?(name_train)
      user_trains[name_train].delete_carriage
    else
      puts "Something wrong"
    end

  when 13
    puts "Enter the name train for comeback"
    name_train = gets.chomp
    if user_trains.key?(name_train)
      if user_trains[name_train].current_station == train.current_route.stations(0)
        puts "This is a firs station"
      else
        user_trains[name_train].down_station
      end
    else
      puts "Something wrong"
    end

  when 14
    print instructions

  # using block for puts trains in station
  when 16
    puts "Enter the name of station"
    name_station = gets.chomp
    puts_block { puts user_stations[name_station].trains_block_arr }

  # add train to station
  when 17
    puts "Enter name station"
    name_station = gets.chomp
    puts "Enter name train"
    name_train = gets.chomp
    user_stations[name_station].add_train(user_trains[name_train])

  # using block for puts carriages in train
  when 18
    puts "Enter name train"
    name_train = gets.chomp
    puts_block { puts user_trains[name_train].carriages_block_arr }

  when 19
    puts "Enter name carriage"
    name_carriage = gets.chomp
    if user_carriages[name_carriage].type == 1
      if user_carriages[name_carriage].free_seats > 0
        user_carriages[name_carriage].take_seat
        puts "Free seats: #{user_carriages[name_carriage].free_seats}"
      else
        puts "This cariiage have'nt seats"
      end
    elsif user_carriages[name_carriage].type == 0
      puts "How many volume you want to take"
      take = gets.chomp.to_i
      user_carriages[name_carriage].take_volume(take)
    end

  else
    puts "Something wrong"

  end

  puts 'Show instructions 14'
  print 'Action: '
  action = gets.chomp.to_i

end

exit
