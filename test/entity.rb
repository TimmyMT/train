class Entity
  attr_accessor :number

  MYCONST = /\d/

  def initialize(number)
    @number = number
    validate!
  end

  protected

  def validate!
    raise "Wrong params" if @number !~ MYCONST
    true
  end

end