require 'minitest/autorun'
require './LabStudents/models/student'
require 'json'

class StudentTest < Minitest::Test
  def setup
    @student = Student.new('Дженсен', 'Адам', 'Гигачадович',
                           id: 10, phone: '79189990451', telegram: 'i_never_asked_4_this',
                           email: 'deus@gmail.com', git: 'classified')
  end

  def test_student_init_all_params_correct
    assert @student.last_name == 'Дженсен'
    assert @student.first_name == 'Адам'
    assert @student.father_name == 'Гигачадович'
    assert @student.id == 10
    assert @student.phone == '79189990451'
    assert @student.telegram == 'i_never_asked_4_this'
    assert @student.email == 'deus@gmail.com'
    assert @student.git == 'classified'
  end

  def test_student_empty_options
    Student.new('Дженсен', 'Адам', 'Гигачадович')
  end

  def test_student_short_contact
    short_contact = @student.short_contact

    assert short_contact[:type] == :telegram
    assert short_contact[:value] == 'i_never_asked_4_this'
  end

  def test_student_has_contacts
    assert @student.has_contacts? == true
  end

  def test_student_has_git
    assert @student.has_git? == true
  end

  def test_student_valid
    assert @student.valid? == true
  end

  def test_student_set_contacts
    stud = Student.new('Дженсен', 'Адам', 'Гигачадович')
    stud.set_contacts(phone: '79189990451', telegram: 'i_never_asked_4_this', email: 'deus@gmail.com')

    assert stud.phone == '79189990451'
    assert stud.telegram == 'i_never_asked_4_this'
    assert stud.email == 'deus@gmail.com'
  end

  def test_student_last_name_and_initials
    assert @student.last_name_and_initials == 'Дженсен А. Г.'
  end
end
