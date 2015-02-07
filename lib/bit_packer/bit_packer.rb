require 'bit_packer/helpers'

module LPCinator
  module BitPacker
    extend self

    UNVOICED_FRAME_KEYS = [:gain, :repeat, :pitch, :k1, :k2, :k3, :k4]
    REPEAT_FRAME_KEYS   = [:gain, :repeat, :pitch]
    DEFAULT_DELIMITER   = ','

    def pack(frame_data, options = {})
      binary   = FrameDataBinaryEncoder.process(frame_data)
      hex      = HexConverter.process(binary)
      reversed = NibbleBitReverser.process(hex)
      flipped  = NibbleSwitcher.process(reversed)
      flipped.join(options[:delimiter] || DEFAULT_DELIMITER)
    end

    def unpack(byte_stream)
      bytes    = byte_stream.scan(/[0-9a-f]+/i)
      flipped  = NibbleSwitcher.process(bytes)
      reversed = NibbleBitReverser.process(flipped)
      binary   = HexByteBinaryEncoder.process(reversed).join
      frame_data_for(binary)
    end

  private

    def frame_data_for(binary)
      [].tap do |frame_data|
        while !binary.length.zero?
          frame_data << {}.tap do |frame|
            LPCinator::CodingTable::BITS.each do |key, value|
              frame[key] = binary.slice!(0, value).to_i(2)
              break if frame[:gain]   == 0
              break if frame[:pitch]  == 0 && frame_has_exact_keys?(UNVOICED_FRAME_KEYS, frame)
              break if frame[:repeat] == 1 && frame_has_exact_keys?(REPEAT_FRAME_KEYS, frame)
            end
          end
        end
      end
    end

    def frame_has_exact_keys?(keys, frame)
      keys & frame.keys == keys
    end
  end
end
