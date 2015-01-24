module LPCinator
  class RMSNormalizer
    PEAK_RMS_INDEX = -2

    def self.normalize!(parameters_for_all_frames)
      new(parameters_for_all_frames).normalize!
    end

    def self.max_index
      LPCinator::CodingTable::RMS[0..PEAK_RMS_INDEX].length - 1
    end

    def initialize(parameters_for_all_frames)
      @parameters_for_all_frames = parameters_for_all_frames
    end

    def normalize!
      parameters_for_all_frames.each do |parameters|
        parameters.rms = (parameters.rms * ratio).round
      end
    end

    private

    def ratio
      @ratio ||= LPCinator::CodingTable::RMS[PEAK_RMS_INDEX].to_f / parameters_for_all_frames.max_by(&:rms).rms
    end

    attr_reader :parameters_for_all_frames
  end
end
