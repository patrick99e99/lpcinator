module LPCinator
  class Matrix
    class Row
      attr_reader :columns

      def initialize(columns, options = {})
        @columns  = columns
        @delegate = options[:delegate]
        @column   = options[:column]
      end

      def ==(other)
        other == columns
      end

      def []=(index, options = {}, value)
        columns[index - 1] = value
        delegate.row_element_was_updated(column, columns) unless options[:do_not_notify]
      end

      private

      attr_reader :delegate, :column
    end

    def initialize(attrs)
      @rows = []

      number_of_rows    = attrs.fetch(:rows)
      number_of_columns = attrs.fetch(:columns)
      values            = attrs.fetch(:values)

      number_of_rows.times do |index|
        values_for_row = values[index].is_a?(Array) ? values[index] : number_of_columns.times.map { values[index] }
        @rows << Row.new(values_for_row)
      end
    end

    def ==(other)
      other == elements
    end

    def elements
      @elements ||= rows.map(&:columns)
    end

    def [](y, x)
      return nil if y < 1 || y > elements.size
      return nil if x < 1 || x > elements.first.size

      elements[y - 1][x - 1]
    end

    def []=(y, x, value)
      rows[y - 1][x, :do_not_notify => true] = value 
    end

    def row_at_column(column)
      columns = elements.map { |row| row[column - 1] }
      Row.new(columns, { :delegate => self, :column => column })
    end

    def row_element_was_updated(column, columns)
      rows.each_with_index do |row, index|
        row[column, :do_not_notify => true] = columns[index]
      end
    end

  private

    attr_reader :rows
  end
end
