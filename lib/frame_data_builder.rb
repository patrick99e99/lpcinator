module LPCinator
  module FrameDataBuilder
    extend self

    def create_for(reflection_coefficients, energy)
      {}.tap do |frame_data|
        frame_data[:gain] = energy
        return frame_data unless reflection_coefficients

        10.times do |t|
          k = t + 1
          frame_data[key_for(k)] = LPCinator::CodingTable.index_for_closest_value(k, reflection_coefficients[k])
        end
      end
    end

  private

    def key_for(k)
      "k#{k}".to_sym
    end
  end
end

