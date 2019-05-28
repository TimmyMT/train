@trains = [1, 2, 3]
@some_array = []

  def add_trains_to_block
    @trains.each do |train|
      @some_array << train
    end
  end

  @some_array.each do |train|
    yield train
  end