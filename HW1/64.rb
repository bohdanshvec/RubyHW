p arr = [1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 2, 1]
p "Дан целочисленный массив. Найти максимальное количество подряд идущих максимальных элементов."
count = 0
p arr.map {|x| x == arr.max ? [count += 1] : count = 0 }.flatten.max