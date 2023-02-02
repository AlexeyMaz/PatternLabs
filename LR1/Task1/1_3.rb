puts "Введи команду языка ruby"
cmd_ruby = gets.chomp
system "ruby -e \"#{cmd_ruby}\""

puts "Отлично! А теперь введи команду ОС"
cmd_os = gets.chomp
system cmd_os