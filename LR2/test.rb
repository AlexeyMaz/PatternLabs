require_relative 'student_short'
require_relative 'data_list_student_short'

str = StudentShort.new('Дженсен', id: 1, git: 'classified')
list = DataListStudentShort.new([str])

puts list.get_data
