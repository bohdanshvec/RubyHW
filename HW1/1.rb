p arr = [87, 23, 28, 56, 73, 20, 51, 29, 15, 58, 51, 30, 25, 71, 82, 23, 59, 11, 15, 36]
p "Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
p arr.select.with_index { |x, i| x if i.even? } + arr.select.with_index { |x, i| x if i.odd? }
