module LPCinator::BitPacker
  module HexByteBinaryEncoder
    extend self, Helpers

    def process(bytes)
      bytes.map do |byte|
        byte.split('').map do |nibble|
          value = nibble.to_i(16).to_s(2)
          left_zero_pad!(value, 4)
          value
        end
      end.flatten
    end
  end
end
