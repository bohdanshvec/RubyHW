p arr = [87, 23, 28, 56, 73, -37, 51, 29, 15, 58, -46, 30, 25, 71, 82, -23, 59, -1, 87, 36]
p "Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа."
p (1...arr.size).all? {|x| (arr[x].negative? && arr[x-1].positive?) || (arr[x].positive? && arr[x-1].negative?)}