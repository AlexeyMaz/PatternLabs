require 'json'

class Student
  attr_accessor :id
  attr_accessor :surname, :name, :patronymic, :phone, :telegram, :email, :git

  PHONE_REGEX = /\A(\+7|8)\d{10}\z/
  TELEGRAM_REGEX = /^@[A-Za-z0-9\-_]+$/
  EMAIL_REGEX = /^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/

  def initialize(surname, name, patronymic, options = {})
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.id = options[:id]
    self.phone = options[:phone]
    self.git = options[:git]
    self.telegram = options[:telegram]
    self.email = options[:email]
  end

  # сеттеры
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

  # валидаторы для гита и контактов
  def git?
    !git.nil?
  end

  def contacts?
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  def validate
    git? && contacts?
  end

  # сеттер контактов
  def set_contacts(phone:@phone, telegram:@telegram, email:@email)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end

  # фамилия и инициалы
  def surname_n_initials
    "#{surname} #{name[0]}. #{patronymic[0]}."
  end

  # контакты студента
  def contacts
    return "phone= #{phone}" unless phone.nil?
    return "telegram= #{telegram}" unless telegram.nil?
    return "email= #{email}" unless email.nil?

    nil
  end

  # короткая инфа о студенте
  def get_info
    "#{surname_n_initials}, Git: #{git}, #{contacts}"
  end

  # парсинг строки и исключения
  def self.pars_str(str)
    result = JSON.parse(str)
    raise ArgumentError,"The argument must have surname, name, and patronymic" unless
      (result.has_key?('surname') and result.has_key?('name') and result.has_key?('patronymic'))

    name = result.delete('name')
    patronymic = result.delete('patronymic')
    surname = result.delete('surname')
    Student.new(surname, name, patronymic, **result.transform_keys(&:to_sym))
  end

  def to_s
    "id: #{@id}, surname: #{@surname}, name: #{@name}, patronymic: #{@patronymic}, phone: #{@phone}, telegram: #{@telegram}, email: #{@email}, git: #{@git}\n"
  end

end