module ChangeVolume
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    def take_volume
      @free_volume -= 1 if @free_volume > 0
    end

    def clear_volume
      @free_volume += 1 if @free_volume < @volume
    end
  end

end