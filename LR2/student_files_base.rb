class StudentListBase
  private_class_method :new

  def initialize
    self.students = []
    self.cur_id = 1
  end

  # Чтение из файла
  def read_from_file(file_path)
    list = str_to_list(File.read(file_path))
    self.students = list.map { |h| Student.from_hash(h) }
    update_cur_id
  end

  # Запись в файл
  def write_to_file(file_path)
    list = students.map(&:to_hash)
    File.write(file_path, list_to_str(list))
  end

  # Найти студента по айди
  def student_by_id(student_id)
    students.detect { |s| s.id == student_id }
  end

  # Получить список k по счету n объектов класса StudentShort
  def get_k_n_student_short_list(page, count, current_data_list: nil)
    offset = (page - 1) * count # сдвиг элементов массива
    slice = students[offset, count].map { |s| StudentShort.new(s) }

    return DataListStudentShort.new(slice) if current_data_list.nil?

    current_data_list.append(slice)
  end

  # Сортировка по фамилии
  def sorted
    students.sort_by(&:surname)
  end

  # Добавление студента
  def add_student(student)
    student.id = cur_id
    students << student
    self.cur_id += 1
  end

  # Замена студента
  def replace_student(student_id, student)
    idx = student.find_index { |s| s.id == student_id }
    students[idx] = student
  end

  # Удаление студента
  def remove_student(student_id)
    students.reject! { |s| s.id == student_id }
  end

  # Число студентов
  def student_count
    students.size
  end

  # Найти студента по фамилии и инциалам
  def student_by_name(student_name)
    students.filter { |s| s.surname == student_name }
  end

  protected

  def str_to_list(str); end
  def list_to_str(list); end

  private

  # Метод для обновления cur_id
  def update_cur_id
    self.cur_id = students.max_by(&:id).id + 1
  end


  attr_accessor :students, :cur_id
end
