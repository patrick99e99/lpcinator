module LPCinator
  module ClosestValueFinder
    extend self

    def index_or_translated_value(actual, values, translate)
      index = index_for_closest_value(values, actual)
      translate ? values[index] : index
    end

  private

    def index_for_closest_value(values, actual)
      values.each_with_index do |value, index|
        return 0 if index.zero? && actual < value 
        if value > actual
          previous_value = values[index - 1]
          if value - actual < actual - previous_value
            return index
          else
            return index - 1
          end
        end
      end
      values.length - 1
    end
  end
end
