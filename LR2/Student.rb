class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  PHONE_REGEX = /\A(\+7|8)\d{10}\z/
  TELEGRAM_REGEX = /^@[A-Za-z0-9\-_]+$/
  EMAIL_REGEX = /^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def phone=(value)
    if value && !value.match(PHONE_REGEX)
      raise ArgumentError.new("Неправильный формат номера телефона: #{value}")
    end
    @phone = value
  end

  def telegram=(value)
    if value && !value.match(TELEGRAM_REGEX)
      raise ArgumentError.new("Неправильный формат телеграма: #{value}")
    end
    @telegram = value
  end

  def email=(value)
    if value && !value.match(EMAIL_REGEX)
      raise ArgumentError.new("Неправильный формат эл. почты: #{value}")
    end
    @email = value
  end

  def git?
    !git.nil?
  end

  def contacts?
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  def validate
    git? && contacts?
  end

  def set_contacts(phone:@phone, telegram:@telegram, email:@email)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end

  def to_s
    "id: #{@id}, surname: #{@surname}, name: #{@name}, patronymic: #{@patronymic}, phone: #{@phone}, telegram: #{@telegram}, email: #{@email}, git: #{@git}\n"
  end

end