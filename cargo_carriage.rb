require_relative './company.rb'
require_relative './train.rb'

class CargoCarriage
  include Company

  attr_accessor :type, :volume, :free_volume, :trains

  def initialize(volume)
    @volume = volume
    @free_volume = volume
    @type = 0
  end

  def take_volume(take)
    if take <= @volume and (@free_volume - take) > 0
      @free_volume -= take
    else
      puts "This volume more than carriage have"
    end
  end

  def clear_volume(clear)
    if clear <= @volume and (@free_volume + clear) <= @volume
      @free_volume += clear
    else
      puts "This volume more than carriage have"
    end
  end

end