p arr = [87, 23, 28, 56, 73, -37, 87, 29, 15, 58, -46, 30, 25, 71, 82, -23, 59, -46, 87, 36]
p "Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального."
p arr.size - arr.rindex(arr.min) - 1