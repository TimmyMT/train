require_relative './company.rb'
# require_relative './valid.rb'

class CargoCarriage
  include Company

  attr_accessor :type, :volume, :taked_volume, :free_volume
  attr_reader :trains

  def initialize(volume)
    @volume = volume
    @taked_volume = 0
    @free_volume = volume
    @type = 0
  end

  def take_volume(take)
    if take <= @volume
      @taked_volume = take
      @free_volume -= @taked_volume
    else
      puts "This volume more than we have"
    end
  end


end