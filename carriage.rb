require_relative './company.rb'
require_relative './valid.rb'

class Carriage
  include Company

  attr_accessor :type
  attr_reader :trains
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

  protected

  def validate!
    raise "@type can't be nil" if @type.nil?
    raise "Wrong parameters, need enter to '1' or '0'" if @type < 0
    true
  end

end
