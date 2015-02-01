module LPCinator
  module FrameDataBuilder
    extend self

    MINIMUM_UNVOICED_GAIN_PARAMETER = 2

    def create_for(parameters, pitch, options = {})
      {}.tap do |frame_data|
        translate = !!options[:translate]

        frame_data[:gain] = closest_gain_match_for(parameters.rms, translate)
        next if frame_data[:gain].zero?

        frame_data[:repeat] = 0
        frame_data[:pitch]  = closest_pitch_match_for(pitch, parameters.k[1], translate)
        modify_gain_from_options!(frame_data, options)

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

    def closest_pitch_match_for(pitch, k1, translate)
      return 0 if k1 >= 0
      values = LPCinator::CodingTable.pitch
      LPCinator::ClosestValueFinder.index_or_translated_value(pitch, values, translate)
    end

    def closest_gain_match_for(rms, translate)
      values = LPCinator::CodingTable.rms
      LPCinator::ClosestValueFinder.index_or_translated_value(rms, values, translate)
    end

    def closest_k_match_for(k, actual, translate)
      values = LPCinator::CodingTable.k_bin_for(k)
      LPCinator::ClosestValueFinder.index_or_translated_value(actual, values, translate)
    end

    def modify_gain_from_options!(frame_data, options)
      pitch = frame_data[:pitch]

      if pitch.zero? && options[:unvoiced_gain]
        target = options[:unvoiced_gain]
      elsif !pitch.zero? && options[:voiced_gain]
        target = options[:voiced_gain]
      else
        return
      end
      
      frame_data[:gain] = LPCinator::ParameterModifier.value_for(frame_data[:gain], target, { 
        min: MINIMUM_UNVOICED_GAIN_PARAMETER, 
        max: LPCinator::RMSNormalizer.max_index, 
      })
    end
  end
end

