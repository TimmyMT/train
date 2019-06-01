require_relative './company.rb'
require_relative './valid.rb'

class Carriage
  include Company

  attr_accessor :trains, :type, :volume, :occupied_volume

  def initialize(type, volume)
    @type = type
    @volume = volume
    @occupied_volume = 0
    validate!
  end

  def free_volume
    @volume - @occupied_volume
  end

  def take_volume(place = 1)
    @volume -= place if free_volume >= place
  end

  protected

  def validate!
    raise "@type can't be nil" if @type.nil?
    raise "Wrong parameters, need enter to '1' or '0'" if @type < 0
    true
  end
end