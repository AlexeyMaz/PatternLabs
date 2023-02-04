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

# локальный максимум
def local_max?(arr, idx)
  idx = Integer(idx)
  return false unless idx.between?(1, arr.length - 2)

  arr[idx - 1] <= arr[idx] and arr[idx + 1] <= arr[idx]
end

# элементы, меньшие среднего арифметического
def elems_less_than_avg(arr)
  avg = arr.sum / arr.length.to_f
  arr.filter { |x| x < avg }
end

# элементы, встречающиеся более трех 3 раз
def elems_more_than_3_times(arr)
  arr.filter { |x| arr.count(x) > 3 }.uniq
end

file_path = 'C:/Users/sulta/OneDrive/Документы/GitHub/PatternLabs/LR1/Task4/array.txt'
file = File.open(file_path)
arr = file.readline.split(' ').map(&:to_i)

puts "Введённый массив: #{arr.inspect}"
puts "Какую задачу решать?
1 - Циклический сдвиг влево на три позиции
2 - Нахождение элементов перед первым минимальным
3 - Нахождение локального максимума
4 - Нахождение элементов меньше среднего арифметического
5 - Нахождение элементов, встречающихся более трех раз"

n = gets.chomp.to_i
case n
when 1
  puts "Результат: #{cycle_triple_shift_left(arr)}"
when 2
  puts "Результат: #{elems_b4_1st_min(arr)}"
when 3
  puts 'Введите индекс предполагаемого локального максимума'
  idx = gets.chomp.to_i
  puts "Результат: #{local_max?(arr, idx)}"
when 4
  puts "Результат: #{elems_less_than_avg(arr)}"
when 5
  puts "Результат: #{elems_more_than_3_times(arr)}"
else
  puts 'Такого метода нет'
end