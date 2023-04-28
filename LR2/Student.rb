class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  PHONE_REGEX = /\A(\+7|8)\d{10}\z/


  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    self.phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def phone=(value)
    if value && !value.match(PHONE_REGEX)
      raise ArgumentError.new("Неправильный формат номера телефона: #{value}")
    end
    @phone = value
  end

  def to_s
    "id: #{@id}, surname: #{@surname}, name: #{@name}, patronymic: #{@patronymic}, phone: #{@phone}, telegram: #{@telegram}, email: #{@email}, git: #{@git}\n"
  end

end