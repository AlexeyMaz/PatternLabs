if ARGV.count < 1
  puts "Вы не ввели аргументы"
  return
end

user = ARGV[0]
puts "Привет, #{user}!"

puts "Какой у вас любимый язык программирования?"
lang = gets.chomp.downcase

if lang == "ruby"
  puts "Вы Вы"
elsif lang == "python"
  puts "Вы гигачад"
elsif lang == "c-sharp"
  puts "Выбор гигачада!"
elsif lang == "pascal"
  puts "Выбор клоуна"
else
  puts "Скоро будет ruby👍"
end