module LPCinator::BitPacker
  module FrameDataBinaryEncoder
    extend self, LPCinator::BitPacker::Helpers

    def process(frame_data)
      frame_data.map do |frame|
        [].tap do |binary|
          LPCinator::CodingTable::BITS.each do |parameter, bits|
            break if !frame[parameter]
            value = frame[parameter].to_s(2)
            left_zero_pad!(value, bits)
            binary << value
          end
        end
      end.join.scan(/\d{4}/)
    end
  end
end
