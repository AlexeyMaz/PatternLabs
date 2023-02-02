def prime?(x)
  return false if x <= 1
  return true if x == 2

  (2..Math.sqrt(x).ceil).each { |i| return false if x % i == 0 }
  true
end

def sum_np_divisors(x)
  sum = 0
  (1..x).each { |i| sum += i if !prime?(i) &&  x % i == 0 }
  sum
end


def digits_less_than3_cnt(x)
  cnt = 0
  x.digits.each { |digit| cnt += 1 if digit < 3}
  cnt
end

puts 'Введите число: '
num = gets.to_i
puts "Сумма непростых делителей: #{sum_np_divisors(num)}"
puts "Количество цифр, меньше 3: #{digits_less_than3_cnt(num)}"