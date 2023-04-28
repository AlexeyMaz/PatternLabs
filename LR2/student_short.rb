require 'json'

class StudentShort
  attr_reader :id, :git, :contact

  def initialize(id, info_str)
    self.id = id
    result = JSON.parse(info_str)
    raise ArgumentError,"The argument must have surname, name, and patronymic" unless
      (result.has_key?('surname') and result.has_key?('name') and result.has_key?('patronymic'))

    @surname = result['surname']
    @initials = "#{result['name'][0]}. #{result['patronymic'][0]}."
    set_contacts(result)
  end

  def self.from_student(student)
    info = { surname: student.surname, name: student.name, patronymic: student.patronymic,
             git: student.git, email: student.email, phone: student.phone, telegram: student.telegram }
    StudentShort.new(student.id, JSON.generate(info))
  end

  def last_name_and_initials
    "#{last_name} #{initials}"
  end

  private

  attr_reader :last_name, :initials

  def set_contacts(contacts)
    return @contact = contacts['phone'] if contacts.key?('phone')
    return @contact = contacts['telegram'] if contacts.key?('telegram')

    @contact = contacts['email'] if contacts.key?('email')
  end
end