p a = 1234
p "Дано целое число. Найти сумму его цифр."
p a.to_s.chars.map {|x| x.to_i}.inject(&:+)