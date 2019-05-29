require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'
# require_relative './change_volume.rb'

class CargoCarriage < Carriage
  include Company
  # include ChangeVolume

  attr_accessor :trains, :type, :volume, :free_volume

  def initialize(volume)
    @volume = volume
    @free_volume = volume
    @type = 0
  end

  # def take_volume(take)
  #   if take <= @volume and (@free_volume - take) > 0
  #     @free_volume -= take
  #   else
  #     puts "This volume more than carriage have"
  #   end
  # end
  #
  # def clear_volume(clear)
  #   if clear <= @volume and (@free_volume + clear) <= @volume
  #     @free_volume += clear
  #   else
  #     puts "This volume more than carriage have"
  #   end
  # end

end