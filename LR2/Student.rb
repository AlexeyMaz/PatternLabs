class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git
  def initialize(surname, name, patronymic)
    @id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone
    @telegram
    @email
    @git
  end

  def to_s
    "id: #{@id}, surname: #{@surname}, Name: #{@name}, patronymic: #{@patronymic}, telegram #{@telegram}, email #{@email}, git: #{@git}\n"
  end

end