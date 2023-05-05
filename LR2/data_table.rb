class DataTable

  attr_reader :rows_count, :cols_count

  def initialize(table)
    self.rows_count = table.length
    max_cols = 0
    table.each do |row|
      max_cols = row.length if row.size > max_cols
    end
    self.cols_count = max_cols
    self.table = table
  end

  # метод для получения элемента по индексам
  def get_item(row, col)
    return nil if row >= rows_count || row.negative?
    return nil if col >= cols_count || col.negative?

    table[row][col]
  end

  def to_s
    table.map { |row| "[#{row.join(', ')}]" }.join("\n")
  end

  private

  attr_accessor :table
  attr_writer :rows_count, :cols_count

end


table = DataTable.new([
                        [7, 2, 0],
                        [5, 1, 4],
                        [9, 5, 5]
                      ])

puts table.get_item(1, 2)
puts table
puts table.cols_count
puts table.rows_count
