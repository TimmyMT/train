require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'
# require_relative './change_volume.rb'

class CargoCarriage < Carriage
  include Company
end