p arr = [87, 23, 28, 56, 73, -37, 51, 29, 15, 58, -46, 30, 25, 71, 82, -23, 59, -1, 87, 36]
p "Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные."
p arr.partition { |x| x.odd? }.flatten