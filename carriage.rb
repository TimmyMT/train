require_relative './company.rb'
require_relative './valid.rb'

class Carriage
  include Company

  attr_accessor :trains, :type, :volume, :free_volume

  @type = 0

  def initialize(type)
    if type == 1
      @type = 1
    elsif type == 0
      @type = 0
    else
      @type = -1
    end
    validate!
  end

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

  protected

  def validate!
    raise "@type can't be nil" if @type.nil?
    raise "Wrong parameters, need enter to '1' or '0'" if @type < 0
    true
  end

end