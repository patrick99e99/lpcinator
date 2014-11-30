module LPCinator::HexByteStreamer
  extend self

  BIT_TABLE = {
    :gain => 4,
    :repeat => 1,
    :pitch => 6,
    :k1 => 5,
    :k2 => 5,
    :k3 => 4,
    :k4 => 4,
    :k5 => 4,
    :k6 => 4,
    :k7 => 4,
    :k8 => 3,
    :k9 => 3,
    :k10 => 3,
  }

  def process!(frames)
    bit_patterns = bit_patterns_for(frames)
    reversed_hex_bytes_from(bit_patterns).join(',')
  end

private

  def bit_patterns_for(frames)
    frames.map do |frame|
      BIT_TABLE.keys.map.each_with_index do |key, index|
        next unless frame[key]
        frame[key].to_s(2).tap do |bits|
          while bits.length < BIT_TABLE[key]
            bits.insert(0, '0')
          end
        end
      end
    end.flatten.compact.join
  end
  
  def reversed_hex_bytes_from(bit_patterns)
    bit_patterns.scan(/\d{4}/).map(&:reverse).each_slice(2).map do |byte|
      reversed_hex_byte byte
    end
  end
  
  def reversed_hex_byte(byte)
    reversed = byte.join.to_i(2).to_s(16).reverse
    if reversed.length == 1
      reversed << '0'
    end
    reversed
  end
end

