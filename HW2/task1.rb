p array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
puts

puts "– дізнатись кількість елементів в масиві;"
p array.size
puts

puts "– перевернути масив;"
p array.reverse
puts

puts "– знайти найбільше число;"
p array.max
puts

puts "– знайти найменше число;"
p array.min
puts

puts "– відсортувати від меншого до більшого;"
p array.sort
puts

puts "– відсортувати від більшого до меншого;"
p array.sort.reverse
puts

puts "– видалити всі непарні числа;"
p array.select { |x| x.even? }
puts

puts "– залишити тільки ті числа, які без остачі ділятся на 3;"
p array.select { |x| x % 3 == 0 }
puts

puts "– видалити з масиву числа, які повторюються (тобто, потрібно вивести масив, в якому немає повторень);"
p array.uniq
puts

puts "– розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого;"
p array.map { |x| x / 10.0 }
puts

puts "– отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в вашому масиві;"
p array_new = array.grep(1..26).map { |x| (x + 96).chr } 
puts

p array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
puts "– змінити місцями мінімальний і максимальний елементи масиву;"
a = array.index(array.min)
b = array.index(array.max)
array[a], array[b] = array[b], array[a]
p array
puts

puts "– знайти елементи, які знаходяться перед мінімальним числом в масиві;"
p array[array.index(array.min) - 1]
puts

puts "– необхідно знайти три найменших елементи."
p array.min(3)
