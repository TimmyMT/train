require_relative './company.rb'
# require_relative './valid.rb'

class PassengerCarriage
  include Company

  attr_accessor :type, :seats, :seats_count
  attr_reader :trains

  def initialize(seats_count)
    @seats_count = seats_count
    @seats = []
    @type = 1
  end

  def take_seat
    if @seats.count < @seats_count
      @seats << 1
    else
      puts "All seats taked"
    end
  end

  def taked_seats
    @seats.count
  end

  def free_seats
    @seats_count - @seats.count
  end



end
