require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'
# require_relative './change_volume.rb'

class PassengerCarriage < Carriage
  include Company

  def take_volume
    super(1)
  end
end
