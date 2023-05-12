require_relative 'Student'

stud1 = Student.new("Уайт","Уолтер", "Хартвелл", {id: 1, phone: '89001231231', git: 'dfs'})

stud1.set_contacts(telegram: '@heisenberg')
print stud1.to_s

puts Student.pars_str('{"surname": "Дженсен", "name": "Адам", "patronymic": "Никогдаобэтомнепросилович",
                      "id": 2, "phone_number": "+79180451280"}')