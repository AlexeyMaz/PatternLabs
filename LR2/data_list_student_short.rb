require_relative 'data_list'

class DataListStudentShort < DataList
  def initialize(objects)
    super(objects)
  end

  def get_names
    %w[last_name_and_initials git contact]
  end

  def get_data
    result = []
    id = 0
    objects_list.each do |object|
      row = []
      row << id
      row << object.last_name_and_initials
      row << object.git
      row << object.contact
      result << row
      id += 1
    end

    DataTable.new(result)
  end
end
