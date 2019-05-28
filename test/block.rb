def call_block
  puts "begin block"
  yield
  puts "end block"
end

@car = [1, 2, 3, 4]

call_block { puts @car }