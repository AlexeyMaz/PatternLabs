require_relative 'Student'

stud1 = Student.new(id: 1, surname: "Уайт", name: "Уолтер", patronymic: "Хартвелл", email: "dfs@gmail.com",
                    phone: '89001231231', telegram: '@heisenberg', git: 'dfs')
puts stud1.validate
print stud1.to_s