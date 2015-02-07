module LPCinator::BitPacker
  module NibbleBitReverser
    extend self, Helpers

    def process(bytes)
      bytes.map do |byte|
        byte.split('').map do |nibble|
          value = nibble.to_i(16).to_s(2)
          left_zero_pad!(value, 4)
          value.reverse.to_i(2).to_s(16)
        end.join
      end
    end
  end
end
