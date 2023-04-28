require_relative 'Student'

stud1 = Student.new(id: 1, surname: "Уайт", name: "Уолтер", patronymic: "Хартвелл", phone: '89001231231', git: 'dfs')

stud1.set_contacts(telegram: '@heisenberg')
print stud1.to_s