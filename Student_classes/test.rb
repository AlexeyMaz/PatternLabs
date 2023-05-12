require 'mysql2'
require_relative 'student_list_db'

student_list = StudentListDB.new

student = student_list.student_by_id(1)
puts student.inspect

student2 = Student.new('Подпивковный', 'Василий', 'Аристархович', id: 1, telegram: '@batya')
id = student_list.add_student(student2)
puts "id нового студента: #{id}"

student_list.replace_student(4, student2)

student_list.remove_student(5)
deleted_student = student_list.student_by_id(id)
puts "Удален студент #{deleted_student.inspect}"
