require 'json'
require_relative 'student_short'

class Student < StudentShort
  attr_writer :id
  attr_reader :surname, :first_name, :patronymic, :phone, :telegram, :email, :git

  # валидаторы
  def self.valid_phone?(phone)
    phone.match(/\A(7|8)\d{10}\z/)
  end

  def self.valid_name?(name)
    name.match(/^[А-Я][а-я]+$/)
  end

  def self.valid_acc?(account)
    account.match(/^@[A-Za-z0-9\-_]+$/)
  end

  def self.valid_email?(email)
    email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
  end


  # стандартный конструктор
  def initialize(surname, first_name, patronymic, id: nil, git: nil, phone: nil, email: nil, telegram: nil)
    self.surname = surname
    self.first_name = first_name
    self.patronymic = patronymic
    self.id = id
    self.git = git
    set_contacts(phone: phone, email: email, telegram: telegram)
  end

  # конструктор из json-строки
  def self.init_from_json(str)
    params = JSON.parse(str, { symbolize_names: true })
    from_hash(params)
  end

  # Конструктор, принимающий хэш
  def self.from_hash(hash)
    raise ArgumentError, 'Missing fields: surname, first_name, patronymic' unless hash.key?(:first_name) && hash.key?(:surname) && hash.key?(:patronymic)

    first_name = hash.delete(:first_name)
    surname = hash.delete(:surname)
    patronymic = hash.delete(:patronymic)

    Student.new(surname, first_name, patronymic, **hash)
  end

  def to_hash
    attrs = {}
    %i[surname name patronymic id phone telegram email git].each do |attr|
      attr_val = send(attr)
      attrs[attr] = attr_val unless attr_val.nil?
    end
    attrs
  end

  # сеттеры
  def phone=(phone)
    raise ArgumentError, "Incorrect value: phone=#{phone}!" if !phone.nil? && !Student.valid_phone?(phone)

    @phone = phone
  end

  def first_name=(first_name)
    raise ArgumentError, "Incorrect value: first_name=#{first_name}!" if !first_name.nil? && !Student.valid_name?(first_name)

    @first_name = first_name
  end

  def surname=(surname)
    raise ArgumentError, "Incorrect value: surname=#{surname}!" if !surname.nil? && !Student.valid_name?(surname)

    @surname = surname
  end

  def patronymic=(patronymic)
    raise ArgumentError, "Incorrect value: patronymic=#{patronymic}!" if !patronymic.nil? && !Student.valid_name?(patronymic)

    @patronymic = patronymic
  end

  def git=(git)
    raise ArgumentError, "Incorrect value: git=#{git}!" if !git.nil? && !Student.valid_acc?(git)

    @git = git
  end

  def telegram=(telegram)
    raise ArgumentError, "Incorrect value: telegram=#{telegram}!" if !telegram.nil? && !Student.valid_acc?(telegram)

    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError, "Incorrect value: email=#{email}!" if !email.nil? && !Student.valid_email?(email)

    @email = email
  end


  # сеттер контактов
  def set_contacts(phone: @phone, telegram: @telegram, email: @email)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end

  # фамилия и инициалы
  def surname_n_initials
    "#{surname} #{first_name[0]}. #{patronymic[0]}."
  end

  # контакты студента
  def contact
    return "phone: #{phone}" unless phone.nil?
    return "telegram: #{telegram}" unless telegram.nil?
    return "email: #{email}" unless email.nil?

    nil
  end

  # короткая инфа о студенте
  def get_info
    "#{surname_n_initials}, Git: #{git}, #{contact}"
  end

  def to_s
    result = "#{surname} #{first_name} #{patronymic}"
    result += " id=#{id}" unless id.nil?
    result += " phone=#{phone}" unless phone.nil?
    result += " git=#{git}" unless git.nil?
    result += " telegram=#{telegram}" unless telegram.nil?
    result += " email=#{email}" unless email.nil?

    result
  end

end