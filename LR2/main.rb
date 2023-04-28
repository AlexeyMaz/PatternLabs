require_relative 'Student'

stud1 = Student.new(surname: "Уайт", name: "Уолтер", patronymic: "Хартвелл", email: "dfs@gmail.", phone: '+7918')
print stud1.to_s

stud2 = Student.new(surname: "Пинкман", name: "Джесси", patronymic: "Брюс")
print stud2.to_s

stud3 = Student.new(surname: "Мазницкий", name: "Алексей", patronymic: "Андреевич")
print stud3.to_s