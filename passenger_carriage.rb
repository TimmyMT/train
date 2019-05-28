require_relative './company.rb'
require_relative './train.rb'
# require_relative './valid.rb'

class PassengerCarriage
  include Company

  attr_accessor :trains, :type, :seats, :free_seats
  # @free_seats = 0

  def initialize(seats)
    @seats = seats
    @free_seats = seats
    @type = 1
  end

  def take_seat
    @free_seats -= 1 if @free_seats > 0
  end

  def clear_seat
    @free_seats += 1 if @free_seats < @seats
  end

end
