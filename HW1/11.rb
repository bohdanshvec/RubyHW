p arr = [87, 23, 28, 56, 73, -37, 51, 29, 15, 58, -46, 30, 25, 71, 82, -23, 59, -1, 15, 36]
p "Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального."
p arr.map {|x| x.negative? ? arr.min : x }
