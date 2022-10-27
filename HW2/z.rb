p @health = 65

p z = rand(0..(100-@health))
puts "Пока вы спите, ваше здоровье восстановиться на #{z}"
puts
10.times { |x| print x; sleep 0.5 }
puts
p @health += z