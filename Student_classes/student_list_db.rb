require 'mysql2'
require_relative 'Student'

class StudentListDB
  def initialize(db_config)
    self.client = Mysql2::Client.new(db_config)
  end

  def add_student(student)
    stmt = client.prepare('INSERT INTO student(surname, first_name, patronymic, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
    stmt.execute(*student_fields(student))
    client.last_id
  end

  def remove_student(student_id)
    client.query("DELETE FROM student WHERE id = #{student_id}")
  end

  def replace_student(student_id, student)
    stmt = client.prepare('UPDATE student SET surname = ?, first_name = ?, patronymic = ?, phone = ?, telegram = ?, email = ?, git = ? WHERE id = ?')
    stmt.execute(*student_fields(student), student_id)
  end

  def student_by_id(student_id)
    client.query("SELECT * FROM student WHERE id = #{student_id}").first.tap do |result|
      return Student.from_hash(result) if result
    end
    nil
  end

  def get_k_n_student_short_list(k, n)
    students = client.query("SELECT * FROM student LIMIT #{n} OFFSET #{(k-1)*n}")
    slice = students.map { |h| StudentShort.new(Student.from_hash(h)) }
    DataListStudentShort.new(slice)
  end

  def student_count
    client.query('SELECT COUNT(id) FROM student').first.values.first
  end


  private


  attr_accessor :client

  def student_fields(student)
    [student.surname, student.last_name, student.patronymic, student.phone, student.telegram, student.email, student.git]
  end
end

db_config = {
  host: 'localhost',
  username: 'root',
  password: '12345',
  database: 'student_db'
}
