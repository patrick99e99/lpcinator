module LPCinator::BitPacker
  module Helpers
    def left_zero_pad!(value, length)
      while value.size < length
        value.insert(0, '0')
      end
    end

    def right_zero_pad!(value, length)
      while value.size < length
        value << '0'
      end
    end
  end
end
