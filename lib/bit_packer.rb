module LPCinator::BitPacker
  extend self

  UNVOICED_FRAME_KEYS = [:gain, :repeat, :pitch, :k1, :k2, :k3, :k4]
  REPEAT_FRAME_KEYS   = [:gain, :repeat, :pitch]
  DEFAULT_DELIMITER   = ','

  module Helpers
    def left_zero_pad!(value, length)
      while value.size < length
        value.insert(0, '0')
      end
    end
  end

  module FrameDataBinaryEncoder
    extend self, Helpers

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

  module NibbleSwitcher
    extend self

    def process(bytes)
      bytes.map do |byte|
        if byte.length == 1
          byte << '0'
        else
          byte.reverse
        end
      end
    end
  end

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

private

  def frame_has_exact_keys?(keys, frame)
    keys & frame.keys == keys
  end
end
