def prime?(x)
  return false if x <= 1
  return true if x == 2

  (2..Math.sqrt(x).ceil).each { |i| return false if x % i == 0 }
  true
end

# 1. Сумма непростых делителей числа
def sum_np_divisors(x)
  sum = 0
  (1..x).each { |i| sum += i if !prime?(i) && x % i == 0 }
  sum
end

# 2. Количество цифр числа, меньших 3
def digits_less_than3_cnt(x)
  cnt = 0
  x.digits.each { |digit| cnt += 1 if digit < 3 }
  cnt
end

# 3. Количество чисел, не являющихся делителями исходного числа,
# не взамнопростых с ним и взаимно простых с суммой простых цифр этого числа
def complicated_nums_cnt(x)
  cnt = 0
  prime_digs_sum = 0
  x.digits.each { |digit| prime_digs_sum += digit if prime?(digit) }
  x.downto(2).each { |i| cnt += 1 if x % i != 0 && i.gcd(x) == 1 && i.gcd(prime_digs_sum) != 1 }
  cnt
end

puts 'Введите число: '
num = gets.to_i
puts "Сумма непростых делителей: #{sum_np_divisors(num)}"
puts "Количество цифр, меньше 3: #{digits_less_than3_cnt(num)}"
puts "Количество чисел задания 3: #{complicated_nums_cnt(num)}"