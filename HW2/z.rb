arr = [1, 2, 3, 4, 5,]
p a = arr.index(arr.min)
p b = arr.index(arr.max)
# arr[a], arr[b] = arr[b], arr[a]
arr[arr.index(arr.min)], arr[arr.index(arr.max)] = arr[arr.index(arr.max)], arr[arr.index(arr.min)]


p arr