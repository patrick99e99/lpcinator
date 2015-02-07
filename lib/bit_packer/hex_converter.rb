module LPCinator::BitPacker
  module HexConverter
    extend self, Helpers

    def process(binary)
      [].tap do |hex|
        binary.flatten.each_slice(2) do |bits|
          value = bits.map { |group| group.to_i(2).to_s(16) }.join
          left_zero_pad!(value, 2)
          hex << value
        end
      end
    end
  end
end
