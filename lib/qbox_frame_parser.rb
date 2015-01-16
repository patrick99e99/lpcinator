module LPCinator
  module QboxFrameParser
    extend self

    def to_hex_byte_stream(file, options = {})
      frames = frames_for(file, options)
      puts LPCinator::HexByteStreamer.translate(frames)
    end

    def frames(file, options)
      puts frames_for(file, options)
    end

    private

    def frames_for(file, options)
      file = File.read(file)

      [].tap do |frames|
        file.each_line do |line|
          next if line.strip.length.zero? || !!(line =~ /[a-z*;]/i)

          values = line.scan(/\d+/).map(&:to_i)
          frame  = {}

          frame[:gain]   = modified_value(values[1], options[:gain])
          frame[:gain]   = 0 if frame[:gain] < 0
          frame[:repeat] = values[2] if values[2] 
          frame[:pitch]  = modified_value(values[3], options[:pitch]) if values[3]
          frame[:pitch]  = 0 if frame[:pitch] && frame[:pitch] < 0
          frame[:k1]     = values[4] if values[4]
          frame[:k2]     = values[5] if values[5]
          frame[:k3]     = values[6] if values[6]
          frame[:k4]     = values[7] if values[7]
          frame[:k5]     = values[8] if values[8]
          frame[:k6]     = values[9] if values[9]
          frame[:k7]     = values[10] if values[10]
          frame[:k8]     = values[11] if values[11]
          frame[:k9]     = values[12] if values[12]
          frame[:k10]    = values[13] if values[13]

          raise "invalid pitch value! must be between 0 and 64" if frame[:pitch] && frame[:pitch] > 64
          raise "invalid gain value! must be between 0 and 16"  if frame[:gain] && frame[:gain] > 16

          frames << frame
        end
      end
    end

    def modified_value(value, optional)
      return value unless optional
      override = optional.to_i.abs

      if /\+/ =~ optional
        value + override
      elsif /-/ =~ optional
        value - override
      else
        override
      end
    end
  end
end
