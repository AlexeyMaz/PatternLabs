# 6, 18, 30, 42, 54

# циклический сдвиг влево на три позиции
def cycle_triple_shift_left(arr)
  arr.rotate(3)
end


# элементы перед первым минимальным
def elems_b4_1st_min(arr)
  arr_min = arr.min
  arr[0, arr.index(arr_min)]
end