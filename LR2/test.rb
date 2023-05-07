require_relative 'student'
require_relative 'student_short'
require_relative 'data_list_student_short'
require_relative 'student_files_base'
require_relative 'student_list_json'
require_relative 'student_list_yaml'
require 'json'


student1 = Student.new('Дженсен', 'Адам', 'Техноментович', telegram: '@classified')
student2 = Student.new('Уайт', 'Уолтер', 'Хартвелл', telegram: '@heisenberg')

puts '--------------------------------'
puts 'Тест StudentsList (JSON):'

stud_list_json = StudentListBase.new(StudentListJSON.new)
stud_list_json.add_student(student1)
stud_list_json.add_student(student2)
stud_list_json.write_to_file('LR2/students.json')

stud_list_json.read_from_file('LR2/students.json')

puts "Успешно записано и прочитано #{stud_list_json.student_count} студентов"

puts '--------------------------------'
puts 'Тест StudentsList (YAML):'

stud_list_yaml = StudentListBase.new(StudentListYAML.new)
stud_list_yaml.add_student(student1)
stud_list_yaml.add_student(student2)

stud_list_yaml.write_to_file('LR2/students.yaml')

stud_list_yaml.read_from_file('LR2/students.yaml')

puts "Успешно записано и прочитано #{stud_list_yaml.student_count} студентов"
