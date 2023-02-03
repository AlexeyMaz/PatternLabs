def min(arr)
  return nil if arr.empty?

  min = arr[0]
  arr.each { |el| min = el if el < min }
  min
end

def first_positive_idx(arr)
  (0..arr.length).each { |i|
    return i if arr[i] > 0
  }
  -1
end

puts('Введите номер метода:')
method = gets.chomp
puts('Введите путь до файла с массивом:')
path = "C:/Users/Al Maz/RubyProjects/PatternLabs/LR1/Task3/" + gets.chomp

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)

puts "Массив, #{array}\n"
case method
when "1"
  puts "Минимальный элемент = #{min(array)}"
when "2"
  puts "Номер первого положительного элемента = #{first_positive_idx(array)}"
else
  puts "такого метода нет"
end