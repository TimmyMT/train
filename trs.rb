load './route.rb'
load './station.rb'
load './train.rb'

station1 = Station.new('first')
station2 = Station.new('two')
station3 = Station.new('three')

route1 = Route.new(station1, station3)
route1.add_station(station2)
train1 = Train.new(1, 1, 3)
train1.route(route1)
station1.all_trains
station1.leave_train
station2.all_trains
station2.leave_train