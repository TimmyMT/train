require_relative './carriage.rb'
require_relative './company.rb'
require_relative './train.rb'
# require_relative './change_volume.rb'

class PassengerCarriage < Carriage
  include Company
  # include ChangeVolume

  attr_accessor :trains, :type, :volume, :free_volume

  def initialize(volume)
    @volume = volume
    @free_volume = volume
    @type = 1
  end

  # def take_volume
  #   @free_volume -= 1 if @free_volume > 0
  # end
  #
  # def clear_volume
  #   @free_volume += 1 if @free_volume < @volume
  # end

end
