module LPCinator
  module FrameDataBuilder
    extend self

    def create_for(segment, parameters, pitch, options = {})
      empty_frame_data.tap do |frame_data|
        return unless parameters

        frame_data[:gain]   = gain_for(segment, parameters.rms)
        frame_data[:pitch]  = pitch || 0
        frame_data[:repeat] = 0

        10.times do |t|
          k = t + 1
          break if k > 4 && frame_data[:pitch].zero?
          frame_data[key_for(k)] = k_for(parameters.k[k], k, options[:translate])
        end
      end
    end

  private

    def key_for(k)
      "k#{k}".to_sym
    end

    def gain_for(segment, rms, translate = false)
      formatted_rms = Math.sqrt(rms / segment.real_size) * (1 << 15)
      index = LPCinator::CodingTable.index_for_closest_rms_value(formatted_rms)
      translate ? LPCinator::CodingTable.rms_values[index] : index
    end

    def k_for(value, bin, translate = false)
      index = LPCinator::CodingTable.index_for_closest_k_value(value, :k => bin)
      translate ? LPCinator::CodingTable.k_bin_for(bin)[index] : index
    end

    def empty_frame_data
      { :gain => 0 }
    end
  end
end

