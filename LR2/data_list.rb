class DataList

  private_class_method :new

  def initialize(objects)
    self.objects_list = objects
    self.selected_objects = []
  end

  def select(number)
    selected_objects.append(number)
  end

  def clear_selected
    self.selected_objects = []
  end

  def get_selected
    return [] if selected_objects.empty?

    selected_id_list = []
    selected_objects.each do |num|
      selected_id_list.append(objects_list[num].id)
    end

    selected_id_list
  end

  protected

  def get_names;
    raise NotImplementedError, 'Будет реализовано в наследнике'
  end

  def get_data;
    raise NotImplementedError, 'Будет реализовано в наследнике'
  end

  private

  attr_accessor :selected_objects, :objects_list
end
