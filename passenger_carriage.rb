# frozen_string_literal: true

require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'

# childe class Carriage
class PassengerCarriage < Carriage
  include Company

  def take_volume
    super(1)
  end
end
