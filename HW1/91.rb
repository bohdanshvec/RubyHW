p arr = [87, 23, 28, 56, 73, -37, 51, 29, 15, -1, -46, 30, 25, 71, 82, -1, 59, -1, 87, 36]
p k = 100
p "Дан целочисленный массив и число К. Если существует элемент, меньший К, то вывести true; в противном случае вывести false."
p arr.any? {|x| x < k}
