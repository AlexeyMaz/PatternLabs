require 'json'

class StudentShort
  attr_accessor :id, :git, :contact, :last_name, :initials

  # стандартный конструктор, принимающий аргументов экземпляр класса student
  # def initialize(student)
  #   @id = student.id
  #
  #   @surname = student.surname
  #   @initials = "#{student.name[0]}. #{student.patronymic[0]}."
  #   @git = student.git unless student.git.nil?
  #   @contact = student.contact
  # end

  def initialize(last_name, id: nil, git: nil, contact: nil, initials: nil)
    self.last_name = last_name
    self.id = id
    self.git = git
    self.contact = contact
    self.initials = initials
  end

  # конструктор, принимающий на вход id и строку, которая содержит всю остальную инфу
  def self.from_str(id, str)
    result = JSON.parse(str)
    raise ArgumentError, "The argument must have surname, name, and patronymic" unless (result.has_key?('surname') and result.has_key?('name') and result.has_key?('patronymic'))

    StudentShort.new(Student.new(result['surname'], result['name'], result['patronymic'], id: id,
                                 phone: result['phone'], git: result['git'],
                                 email: result['email'], telegram: result['telegram']))
  end

  def surname_n_initials
    "#{surname} #{name[0]}. #{patronymic[0]}."
  end

  def git?
    !git.nil?
  end

  def contact?
    !contact.nil?
  end

  def validate?
    git? && contact?
  end

  def to_s
    result = surname_n_initials
    result += " id= #{id} " unless id.nil?
    result += contact unless contact.nil?

    result
  end

  private

  # def set_contacts(contacts)
  #   return @contact = contacts['phone'] if contacts.key?('phone')
  #   return @contact = contacts['telegram'] if contacts.key?('telegram')
  #
  #   @contact = contacts['email'] if contacts.key?('email')
  # end

end