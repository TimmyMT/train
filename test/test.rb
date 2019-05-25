require_relative '../test/entity'

begin
  puts 'Insert number for entity'
  my_param = gets.chomp
  e = Entity.new(my_param)
  puts e
rescue => e
  puts "Ошибка: #{e.message}"
  retry
end