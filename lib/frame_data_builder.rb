module LPCinator
  module FrameDataBuilder
    extend self

    def create_for(segment, parameters, pitch, options = {})
      {}.tap do |frame_data|
        translate = !!options[:translate]

        frame_data[:gain]  = closest_gain_match_for(segment, parameters.rms, translate)
        next if frame_data[:gain].zero?

        frame_data[:repeat] = 0
        frame_data[:pitch]  = pitch || 0

        10.times do |t|
          k = t + 1
          break if k > 4 && frame_data[:pitch].zero?
          frame_data[key_for(k)] = closest_k_match_for(k, parameters.k[k], translate)
        end
      end
    end

  private

    def key_for(k)
      "k#{k}".to_sym
    end

    def closest_gain_match_for(segment, rms, translate)
      formatted_rms = Math.sqrt(rms / segment.real_size) * (1 << 15)
      values = LPCinator::CodingTable.rms
      LPCinator::ClosestValueFinder.index_or_translated_value(formatted_rms, values, translate)
    end

    def closest_k_match_for(k, actual, translate)
      values = LPCinator::CodingTable.k_bin_for(k)
      LPCinator::ClosestValueFinder.index_or_translated_value(actual, values, translate)
    end
  end
end

