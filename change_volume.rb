module ChangeVolume
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods

    def take_volume
      if @type == 1
        @free_volume -= 1 if @free_volume > 0
      elsif @type == 0
        puts "How many take?"
        take = gets.chomp.to_i
        if @free_volume >= take
          @free_volume -= take if @free_volume > 0
        else
          puts "Wrong take volume"
        end
      end
    end

    def clear_volume
      if @type == 1
        @free_volume += 1 if @free_volume < @volume
      elsif @type == 0
        puts "How many clear?"
        clear = gets.chomp.to_i
        if @volume >= clear
          @free_volume = @volume - clear if @free_volume < @volume
        else
          puts "Wrong clear volume"
        end
      end
    end

  end

end