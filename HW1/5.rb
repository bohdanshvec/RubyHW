p arr = [87, 23, 28, 56, 73, 20, 51, 29, 15, 58, 51, 30, 25, 71, 82, 23, 59, 11, 15, 36]
p "Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять."
p arr.map.with_index {|x, i| (x.odd? || (i == 0 || i == (arr.size - 1))) ? x : x + arr.first}

