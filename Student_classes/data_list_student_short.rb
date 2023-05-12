require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList
  def get_names
    %w[last_name_and_initials git contact]
  end

  def get_data
    result = []
    id = 0
    objects_list.each do |obj|
      row = []
      row << id
      row.push(*table_fields(obj))
      result << row
      id += 1
    end

    DataTable.new(result)
  end


  protected

  # сеттер для массива объектов
  def table_fields(object)
    [object.last_name, object.git, object.contact]
  end
end