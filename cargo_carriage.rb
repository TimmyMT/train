# frozen_string_literal: true

require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'

# child class Carriage
class CargoCarriage < Carriage
  include Company
end
