module LPCinator
  module QboxFrameParser
    extend self

    def to_hex_byte_stream(file, options = {})
      frames = frames_for(file, options)
      puts LPCinator::BitPacker.pack(frames)
    end

    def frames(file, options)
      frames_for(file, options)
    end

    private

    def frames_for(file, options)
      file = File.read(file)

      [].tap do |frames|
        lines = []
        file.each_line do |line|
          lines << line unless line.strip.length.zero? || !!(line =~ /[a-z*;]/i)
        end
        
        lines.compact.each_with_index do |line, index|
          values = line.scan(/\d+/).map(&:to_i)
          frame  = {}
          [:gain, :repeat, :pitch, :k1, :k2, :k3, :k4, :k5, :k6, :k7, :k8, :k9, :k10].each do |key|
            value = value_for(key, values, options)
            frame[key] = value if value
          end

          puts "#{frame},"
          frames << frame
        end
      end
    end

    def value_for(key, values, options)
      case key
      when :gain
        value = values[1]
        if options[:translate]
          LPCinator::CodingTable.rms[value]
        else
          modified_value(value, options[:gain], 15)
        end
      when :repeat
        values[2] if values[2]
      when :pitch
        value = values[3]
        return unless value
        if options[:translate]
          LPCinator::CodingTable.pitch[value]
        else
          modified_value(value, options[:pitch], 63)
        end
      when /k(\d)/
        bin = $1.to_i
        value = values[3 + bin]
        return unless value

        options[:translate] ? LPCinator::CodingTable.k_bin_for(bin)[value] : value
      end
    end

    def modified_value(value, optional, max)
      return value unless optional
      override = optional.to_i.abs

      if /\+/ =~ optional
        value += override
      elsif /-/ =~ optional
        value -= override
      else
        value = override
      end

      value > max ? max : value
    end
  end
end
