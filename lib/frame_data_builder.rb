module LPCinator
  module FrameDataBuilder
    extend self

    def create_for(parameters)
      {}.tap do |frame_data|
        return frame_data unless parameters
        frame_data[:gain] = parameters.rms

        10.times do |t|
          k = t + 1
          frame_data[key_for(k)] = LPCinator::CodingTable.index_for_closest_value(k, parameters.k[k])
        end
      end
    end

  private

    def key_for(k)
      "k#{k}".to_sym
    end
  end
end

