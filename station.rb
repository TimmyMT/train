class Station
  attr_reader :trains
  @@trains = []

  def initialize(name)
    @station = name
  end

  def add_train(name)
    @@trains << name
  end
end