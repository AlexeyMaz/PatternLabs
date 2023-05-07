class StudentListBase
  attr_writer :data_type

  def initialize(data_type)
    self.students = []
    self.cur_id = 1
    @data_type = data_type
  end

  # Чтение из файла
  def read_from_file(file_path)
    list = @data_type.str_to_list(File.read(file_path))
    self.students = list.map { |h| Student.from_hash(h) }
    update_cur_id
  end

  # Запись в файл
  def write_to_file(file_path)
    list = students.map(&:to_hash)
    File.write(file_path, @data_type.list_to_str(list))
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
    idx = students.find_index { |s| s.id == student_id }
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

  attr_accessor :students, :cur_id

  private

  # Метод для обновления cur_id
  def update_cur_id
    self.cur_id = students.max_by(&:id).id.to_i + 1
  end
end
